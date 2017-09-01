class AddExtraFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string
    add_column :users, :parent_id, :integer, index: true
  end
end
