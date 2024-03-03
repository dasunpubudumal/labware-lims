class CreateTubes < ActiveRecord::Migration[7.1]
  def change
    create_table :tubes, id: false do |t|
      t.primary_key :tube_barcode, :string

      t.timestamps
    end
  end
end
