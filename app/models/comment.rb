# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :feedback

  scope :activity_last_month, lambda {
    where(created_date: 1.month.ago...Time.now)
      .group('DATE(created_date)')
      .count
  }
end
