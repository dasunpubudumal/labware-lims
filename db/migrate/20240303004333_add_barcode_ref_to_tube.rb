class AddBarcodeRefToTube < ActiveRecord::Migration[7.1]
  def up
    add_column :tubes, :barcode, :string
    add_foreign_key :tubes, :barcodes, column: :tube_barcode, primary_key: :barcode, name: 'barcode'
    add_index :tubes, :barcode
  end

  def down
    remove_index :tubes, :barcode
    remove_foreign_key :tubes, :barcodes, column: :tube_barcode
    remove_column :tubes, :barcode
  end
end
