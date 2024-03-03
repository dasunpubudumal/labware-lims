class Plate < ApplicationRecord
  has_many :wells, foreign_key: 'plate_barcode'
end
