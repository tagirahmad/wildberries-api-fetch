# frozen_string_literal: true

class AddUserNameToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :user_name, :string
  end
end
