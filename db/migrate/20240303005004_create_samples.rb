class CreateSamples < ActiveRecord::Migration[7.1]
  def change
    create_table :samples, id:false do |t|
      t.primary_key :sanger_sample_id, :string
      t.string :sample_id
      t.timestamps
    end
  end
end
