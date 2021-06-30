# frozen_string_literal: true

class AddCreatedDateToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :created_date, :date
  end
end
