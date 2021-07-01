# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def index
    FeedbacksFetcherService.new(Feedback.all.pluck(:real_id), Comment.all.pluck(:real_id)).fetch_new_feedbacks
    render json: Feedback.order('created_date DESC').all
                         .to_json(include: :comments, except: %i[created_at updated_at])
  end

  def ten_commented
    render json: Feedback.ten_commented_last_week.to_json(include: :comments, except: %i[created_at updated_at])
  end
end
