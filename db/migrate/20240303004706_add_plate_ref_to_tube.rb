class AddPlateRefToTube < ActiveRecord::Migration[7.1]
  def up
    add_column :tubes, :plate_barcode, :string
    add_foreign_key :tubes, :plates, column: :plate_barcode, primary_key: :plate_barcode, name: 'barcode'
    add_index :tubes, :plate_barcode
  end

  def down
    remove_index :tubes, :plate_barcode
    remove_foreign_key :tubes, :plates, column: :plate_barcode
    remove_column :tubes, :plate_barcode
  end
end
