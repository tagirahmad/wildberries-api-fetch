# frozen_string_literal: true

namespace :daily do
  desc 'Fetches tasks daily'
  task fetch_feedbacks: :environment do
    FeedbacksFetcherService.new(Feedback.all.pluck(:real_id), Comment.all.pluck(:real_id)).fetch_new_feedbacks
  end
end
