# frozen_string_literal: true

# Models the sample entity
class Sample < ApplicationRecord
  belongs_to :tube, foreign_key: 'tube_barcode'
  belongs_to :customer, foreign_key: 'customer_id'
end
