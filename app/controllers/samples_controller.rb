# frozen_string_literal: true

# Controller for the Sample model
class SamplesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    #  Create a new Sample object with the given parameters
    #  Expected params: {"customer_name": "string", "barcode": "string", "sample_id": "string"}
    # 1. Create a Barcode
    # 2. Create a Tube
    # 3. Create a Sample

    customer_name = params[:customer_name]
    barcode = params[:barcode]
    sample_id = params[:sample_id]

    # 1. Create a Barcode
    barcode = Barcode.create!(barcode: barcode)
    # 2. Create a tube
    tube = Tube.new(barcode: barcode)
    tube.barcode = barcode
    tube.save!

    Rails.logger.info("Barcode created: #{barcode}")

    render json: { barcode: barcode }, status: :created
  end
end
