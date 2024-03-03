class AdddBarcodeRefToPlate < ActiveRecord::Migration[7.1]
  def up
    add_column :plates, :barcode, :string
    add_foreign_key :plates, :barcodes, column: :plate_barcode, primary_key: :barcode, name: 'barcode'
    add_index :plates, :barcode
  end

  def down
    remove_index :plates, :barcode
    remove_foreign_key :plates, :barcodes, column: :plate_barcode
    remove_column :plates, :barcode
  end
end
