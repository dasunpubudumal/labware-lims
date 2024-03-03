class CreateSampleTransferHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :sample_transfer_histories do |t|
      t.string :sample_id
      t.string :source_tube
      t.string :destination_tube

      t.timestamps
    end
  end
end
