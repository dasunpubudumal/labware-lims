# frozen_string_literal: true

# Models the sample entity
class Sample < ApplicationRecord
  validates :sanger_sample_id, uniqueness: true

  belongs_to :tube, foreign_key: 'tube_barcode'
  belongs_to :customer, foreign_key: 'customer_id'

  validates :sample_id, presence: true
  validates :customer, presence: true
end
