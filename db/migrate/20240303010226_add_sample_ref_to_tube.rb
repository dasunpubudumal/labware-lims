class AddSampleRefToTube < ActiveRecord::Migration[7.1]
  def up
    add_column :tubes, :sanger_sample_id, :string
    add_foreign_key :tubes, :samples, column: :sanger_sample_id, primary_key: :sanger_sample_id,
                                      name: 'sanger_sample_id'
    add_index :tubes, :sanger_sample_id
  end

  def down
    remove_index :tubes, :sanger_sample_id
    remove_foreign_key :tubes, :samples, column: :sanger_sample_id
    remove_column :tubes, :sanger_sample_id
  end
end
