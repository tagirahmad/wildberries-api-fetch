# frozen_string_literal: true

class AddRealIdToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :real_id, :string
  end
end
