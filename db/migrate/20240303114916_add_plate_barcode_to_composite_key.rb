class AddPlateBarcodeToCompositeKey < ActiveRecord::Migration[7.1]
  def up
    create_table :new_wells, primary_key: [:row, :column, :plate_barcode] do |t|
      t.integer :row
      t.string :column
      t.string :plate_barcode
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index [:plate_barcode], name: 'new_index_wells_on_plate_barcode'
    end

    add_foreign_key :new_wells, :plates, column: :plate_barcode, primary_key: :plate_barcode

    execute <<-SQL
      INSERT INTO new_wells (row, column, plate_barcode, created_at, updated_at)
      SELECT row, column, plate_barcode, created_at, updated_at
      FROM wells
    SQL

    drop_table :wells

    rename_table :new_wells, :wells
  end

  def down
    drop_table :wells
  end
end
