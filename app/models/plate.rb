# frozen_string_literal: true

# Models the plate entity
class Plate < ApplicationRecord
  has_many :wells, foreign_key: 'plate_barcode'
  belongs_to :barcode, foreign_key: 'plate_barcode'

  validate :validate_wells

  private

  def validate_wells
    return if wells.size <= 96

    errors.add(:wells, 'must have 96 wells')
  end
end
