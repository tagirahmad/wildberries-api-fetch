# frozen_string_literal: true

env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']

# every 1.day, at: '4:30 am' do
#   runner "FeedbacksFetcherService.new(Feedback.all.pluck(:real_id)).fetch_new_feedbacks"
# end

set :output, 'log/cron.log'

set :environment, 'development'

every 1.minute do
  runner "puts 'from schedule.rb!'"
  rake 'daily:fetch_feedbacks'
end
