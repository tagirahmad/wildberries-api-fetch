class AddUpdatedDateToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :updated_date, :date
  end
end
