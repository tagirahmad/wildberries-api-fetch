# frozen_string_literal: true

class ChangeColumnUpdatedDateInFeedback < ActiveRecord::Migration[6.1]
  def change
    change_column :feedbacks, :updated_date, :datetime
  end
end
