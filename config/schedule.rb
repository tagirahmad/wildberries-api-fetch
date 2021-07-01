# frozen_string_literal: true

env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']

set :output, 'log/cron.log'

set :environment, 'development'

every 1.day, at: '4:30 am' do
  rake 'daily:fetch_feedbacks'
end
