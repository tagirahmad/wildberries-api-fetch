# frozen_string_literal: true

require 'net/http'
require 'uri'

# Fethces feedbacks
class FeedbacksFetcherService
  attr_writer :response

  def initialize(ids, comments_ids)
    @ids = ids
    @comments_ids = comments_ids
  end

  WB_URL = 'https://public-feedbacks.wildberries.ru/api/v1/feedbacks'
  DATA = { "skip": 0, "imtId": 19_400_834, "order": 'dateDesc' }.freeze

  def fetch_new_feedbacks
    json_data = JSON.parse(fetch, symbolize_names: true)
    json_data[:feedbacks].select do |json_fb|
      put_into_db(json_fb) unless @ids.include? json_fb[:id]
    end

    json_data[:feedbacks].pluck(:comments).flatten!.compact.select do |c|
      add_new_comment c
    end
  end

  private

  def fetch
    res = Net::HTTP.post URI(WB_URL),
                         DATA.to_json,
                         'Content-Type' => 'application/json'

    @response = res.body
  end

  def put_into_db(feedback)
    fb = create_feedback feedback
    if feedback.key? :comments
      feedback[:comments].map do |c|
        fb.comments.new(text: c[:text],
                        real_id: c[:id],
                        user_name: c[:wbUserDetails][:name],
                        created_date: Time.iso8601(c[:createdDate]))
      end
    end
    fb.save!
  end

  def create_feedback(feedback)
    Feedback.new(text: feedback[:text],
                 product_name: feedback[:productDetails][:productName],
                 real_id: feedback[:id],
                 created_date: Time.iso8601(feedback[:createdDate]),
                 updated_date: feedback[:updatedDate].nil? ? nil : Time.iso8601(feedback[:updatedDate]))
  end

  def add_new_comment(comment)
    return unless @comments_ids.include?(comment[:id])

    Comment.create!(real_id: comment[:id],
                    feedback_id: Feedback.find_by(real_id: comment[:feedbackId]).id,
                    text: comment[:text],
                    user_name: comment[:wbUserDetails][:name])
  end
end
