class CommentsController < ApplicationController
  def activity_last_month
    render json: Comment.activity_last_month.to_json
  end
end
