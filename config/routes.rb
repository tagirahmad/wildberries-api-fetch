# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '', to: 'feedbacks#index'

  get 'ten_commented_last_week', to: 'feedbacks#ten_commented'
end
