class FeedbacksController < ApplicationController
  def index
    # FeedbacksFetcherService.new(Feedback.all.pluck(:real_id)).fetch_new_feedbacks
    # render json: Feedback.order('created_date DESC').all
    #                      .to_json(include: :comments, except: %i[created_at updated_at])
    render json: Feedback.all.to_json
  end
end
