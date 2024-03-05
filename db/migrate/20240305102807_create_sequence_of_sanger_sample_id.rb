class CreateSequenceOfSangerSampleId < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE SEQUENCE sanger_sample_id_seq;
      ALTER TABLE samples ALTER COLUMN sanger_sample_id SET DEFAULT nextval('sanger_sample_id_seq');
      ALTER SEQUENCE sanger_sample_id_seq OWNED BY NONE;
      ALTER SEQUENCE sanger_sample_id_seq OWNED BY samples.sanger_sample_id;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE samples ALTER COLUMN sanger_sample_id SET DEFAULT nextval('sanger_sample_id_seq');
      ALTER SEQUENCE sanger_sample_id_seq OWNED BY samples.sanger_sample_id;
      ALTER SEQUENCE sanger_sample_id_seq OWNED BY NONE;
      DROP SEQUENCE sanger_sample_id_seq;
    SQL
  end
end
