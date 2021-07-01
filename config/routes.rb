# frozen_string_literal: true

Rails.application.routes.draw do
  get '', to: 'feedbacks#index'

  get 'ten_commented_last_week', to: 'feedbacks#ten_commented'

  get 'activity_last_month', to: 'comments#activity_last_month'
end
