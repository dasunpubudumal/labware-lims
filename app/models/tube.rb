# frozen_string_literal: true

# Models the tube entity
class Tube < ApplicationRecord
  belongs_to :barcode, foreign_key: 'tube_barcode'
  validates :barcode, presence: true
end
