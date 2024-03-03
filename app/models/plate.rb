class Plate < ApplicationRecord
  has_many :wells, foreign_key: 'plate_barcode'
  belongs_to :barcode, foreign_key: 'plate_barcode'
end
