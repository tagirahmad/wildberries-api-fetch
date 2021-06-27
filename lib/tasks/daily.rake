namespace :daily do
  desc "TODO"
  task fetch_feedbacks: :environment do
    puts 'from rake'
    Rails.logger.info('Whenever WORKED! (every 1.minute)')
    FeedbacksFetcherService.new(Feedback.all.pluck(:real_id)).fetch_new_feedbacks
  end

end
