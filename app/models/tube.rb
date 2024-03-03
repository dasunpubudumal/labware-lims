class Tube < ApplicationRecord
  belongs_to :barcode, foreign_key: 'tube_barcode'
  belongs_to :sample, foreign_key: 'sanger_sample_id'
end