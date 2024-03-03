class CreatePlates < ActiveRecord::Migration[7.1]
  def up
    create_table :plates, id: false do |t|
      t.primary_key :plate_barcode, :string

      t.timestamps
    end
  end

  def down
    drop_table :plates
  end
end
