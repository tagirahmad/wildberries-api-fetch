class FetchNewFeedbacksJob < ApplicationJob
  queue_as :urgent

  def perform(_)
    FeedbacksFetcherService.new(Feedback.all.pluck(:real_id)).fetch_new_feedbacks
    puts 'Whenever WORKED! (every 1.minute) puts'
    Rails.logger.info('Whenever WORKED! (every 1.minute)')
  end
end
