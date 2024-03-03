class CreateBarcodes < ActiveRecord::Migration[7.1]
  def change
    create_table :barcodes, id: false do |t|
      t.primary_key :barcode, :string

      t.timestamps
    end
  end
end
