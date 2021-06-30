# frozen_string_literal: true

class Feedback < ApplicationRecord
  has_many :comments

  scope :ten_commented_last_week, lambda {
    where(created_date: 1.week.ago...Time.now)
      .includes(:comments)
      .left_joins(:comments)
      .group(:id)
      .order(created_date: :desc)
      .having('COUNT(comments.id) > 0')
      .order('COUNT(comments.id) DESC')
      .limit(10)
  }
end
