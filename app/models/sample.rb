class Sample < ApplicationRecord
  belongs_to :tube, foreign_key: 'tube_barcode'
end
