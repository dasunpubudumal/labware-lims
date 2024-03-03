class AddPlateRefToWells < ActiveRecord::Migration[7.1]
  def up
    add_column :wells, :plate_barcode, :string
    add_foreign_key :wells, :plates, column: :plate_barcode, primary_key: :plate_barcode, name: 'plate_barcode'
    add_index :wells, :plate_barcode
  end

  def down
    remove_index :wells, :plate_barcode
    remove_foreign_key :wells, :plates, column: :plate_barcode
    remove_column :wells, :plate_barcode
  end
end
