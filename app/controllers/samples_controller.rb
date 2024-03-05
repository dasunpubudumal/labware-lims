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
    # 2. Create a customer and a sample
    customer_and_sample = save_customer_and_sample(customer_name, sample_id)
    # 3. Create a tube
    tube = save_tube(barcode, customer_and_sample[:sample])

    Rails.logger.info("Barcode created: #{barcode}")

    render json: { barcode: barcode, tube: tube, customer: customer_and_sample[:customer],
                   sample: customer_and_sample[:sample] },
           status: :created
  end

  private

  def save_tube(barcode, sample)
    tube = Tube.new(barcode: barcode)
    tube.barcode = barcode
    tube.sample = sample
    tube.save!
    tube
  end

  def save_customer_and_sample(customer_name, sample_id)
    customer = Customer.new(customer_name: customer_name)
    sample = Sample.new(sample_id: sample_id)
    sample.customer = customer
    customer.save!
    sample.save!
    { customer: customer, sample: sample }
  end
end
