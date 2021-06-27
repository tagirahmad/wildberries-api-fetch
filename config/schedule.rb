env :PATH, ENV['PATH']

# every 1.day, at: '4:30 am' do
#   runner "FeedbacksFetcherService.new(Feedback.all.pluck(:real_id)).fetch_new_feedbacks"
# end

set :output, "log/cron.log"

every 1.minute do
  # p 'Whenever WORKED! (every 1.minute)'
  # Rails.logger.info("Whenever WORKED! (every 1.minute)")
  # runner "FeedbacksFetcherService.new(Feedback.all.pluck(:real_id)).fetch_new_feedbacks"
  # runner 'FetchNewFeedbacksJob.perform'
  rake 'daily:fetch_feedbacks'
end