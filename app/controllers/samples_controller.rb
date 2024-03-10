# frozen_string_literal: true

# Controller for the Sample model
class SamplesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @samples = Sample.paginate(page: params[:page], per_page: 10)
    render 'samples/index', status: :ok
  end

  def new
    render 'samples/create', status: :ok
  end

  def show
    @sample = Sample.find_by!(sanger_sample_id: params[:sanger_sample_id])
    @customer = Customer.find_by!(id: @sample.customer_id)
    render 'samples/show', status: :ok
  end

  def create
    # Create a new Sample object with the given parameters
    # Expected params: {"customer_name": "string", "barcode": "string", "sample_id": "string"}
    # 1. Create a Barcode
    # 2. Create a Tube
    # 3. Create a Sample
    customer_name = params[:customer_name]
    barcode = params[:barcode]
    sample_id = params[:sample_id]

    result = create_barcode_sample_customer_and_tube(barcode, customer_name, sample_id)

    if result[:success]
      redirect_to "/samples/#{result[:sanger_sample_id]}"
    else
      render :create, status: :unprocessable_entity
    end
  end

  private

  def create_barcode_sample_customer_and_tube(barcode, customer_name, sample_id)
    sanger_sample_id = nil
    success = ActiveRecord::Base.transaction do
      barcode = Barcode.create!(barcode: barcode)
      customer_and_sample = save_customer_and_sample(customer_name, sample_id)
      save_tube(barcode, customer_and_sample[:sample])
      sanger_sample_id = customer_and_sample[:sample].sanger_sample_id
    end
    { success: success, sanger_sample_id: sanger_sample_id }
  end

  def save_tube(barcode, sample)
    tube = Tube.new(barcode: barcode)
    tube.barcode = barcode
    tube.sample = sample
    tube.save!
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
