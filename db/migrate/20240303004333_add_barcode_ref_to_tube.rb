class AddBarcodeRefToTube < ActiveRecord::Migration[7.1]
  def up
    add_foreign_key :tubes, :barcodes, column: :tube_barcode, primary_key: :barcode, name: 'tube_barcode'
    add_index :tubes, :tube_barcode
  end

  def down
    remove_index :tubes, :tube_barcode
    remove_foreign_key :tubes, :barcodes, column: :tube_barcode
  end
end
