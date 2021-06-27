class AddRealIdToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :real_id, :string
  end
end
