class ChangeColumnCreatedDateInFeedback < ActiveRecord::Migration[6.1]
  def change
    change_column :feedbacks, :created_date, :datetime
  end
end
