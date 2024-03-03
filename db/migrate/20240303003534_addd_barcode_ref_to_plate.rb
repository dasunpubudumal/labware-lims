class AdddBarcodeRefToPlate < ActiveRecord::Migration[7.1]
  def up
    add_foreign_key :plates, :barcodes, column: :plate_barcode, primary_key: :barcode, name: 'plate_barcode'
    add_index :plates, :plate_barcode
  end

  def down
    remove_index :plates, :plate_barcode
    remove_foreign_key :plates, :barcodes, column: :plate_barcode
  end
end
