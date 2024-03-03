class AddCustomerRefToSample < ActiveRecord::Migration[7.1]
  def up
    add_column :samples, :customer_id, :integer
    add_foreign_key :samples, :customers, column: :customer_id, primary_key: :id, name: 'customer_id'
    add_index :samples, :customer_id
  end

  def down
    remove_index :samples, :customer_id
    remove_foreign_key :samples, :customers, column: :customer_id
    remove_column :samples, :customer_id
  end
end
