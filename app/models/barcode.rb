# frozen_string_literal: true

# Models the barcode entity
class Barcode < ApplicationRecord
  has_one :plate, foreign_key: 'plate_barcode'
  has_one :well, through: :plate
  has_one :tube
end
