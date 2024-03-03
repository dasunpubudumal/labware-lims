# frozen_string_literal: true

# Models the well entity
class Well < ApplicationRecord
  belongs_to :plate, foreign_key: 'plate_barcode'
  validates :plate, presence: true
  validates :row, presence: true, numericality: { only_integer: true, in: 1..12 }
  validates :column, presence: true, length: { maximum: 1 }, format: { with: /[A-H]/ }
end
