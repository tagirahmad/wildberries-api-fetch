# frozen_string_literal: true

class AddUserNameToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :user_name, :string
  end
end
