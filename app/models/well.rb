class Well < ApplicationRecord
  belongs_to  :plate, foreign_key: 'plate_barcode'
end
