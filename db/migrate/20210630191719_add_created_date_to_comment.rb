# frozen_string_literal: true

class AddCreatedDateToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :created_date, :date
  end
end
