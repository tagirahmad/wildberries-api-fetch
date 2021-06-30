class ChangeColumnCreatedDateInComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :created_date, :datetime
  end
end
