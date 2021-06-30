# frozen_string_literal: true

class AddProductNameToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :product_name, :string
  end
end
