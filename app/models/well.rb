# frozen_string_literal: true

# Models the well entity
class Well < ApplicationRecord
  belongs_to :plate, foreign_key: 'plate_barcode'
  validates :plate, presence: true
end
