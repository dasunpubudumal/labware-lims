class CreateWells < ActiveRecord::Migration[7.1]
  def up
    create_table :wells, primary_key: [:row, :column] do |t|
      t.integer :row
      t.string :column

      t.timestamps
    end
  end

  def down
    drop_table :wells
  end
end
