# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# Note: Please use the seeds only for development and test setups

# Seed data for the application
# The following sequence of steps is followed to seed the database:
# 1. Destroy all existing records in the database
# 2. Seed customers
# 3. Seed samples
# 4. Seed barcodes
# 5. Seed plates
# 6. Seed wells
# 7. Seed tubes

WELL_COUNT = 96

ROWS = 1..12
COLS = 'A'..'H'

Well.destroy_all
Plate.destroy_all
Sample.destroy_all
Tube.destroy_all
Barcode.destroy_all
Customer.destroy_all

customer_ids = 1..10

# Seed Customers
customer_ids.each do |_|
  Customer.create!({
                     customer_name: Faker::Company.name
                   })
end

Rails.logger.info "Seeding samples"

samples = []

# Seed Samples
customer_ids.each do |customer_id|
  Rails.logger.info("Customer ID: #{customer_id}")
  sample = Sample.create!({
                            sanger_sample_id: Faker::Barcode.ean(8),
                            sample_id: Faker::Barcode.ean(8),
                            customer_id: customer_id
                          })
  Rails.logger.info("Saved Sample ID: #{sample.sanger_sample_id}")
  samples.push sample
end

# Seed Barcodes
seed_barcodes = []

10.times do |i|
  seed_barcodes.push("P-#{Faker::Barcode.ean(8)}")
end

seed_barcodes.each do |barcode|
  Barcode.create!({barcode: barcode})
end

# Seed Plates
seed_plates = []

# Seed plates
seed_barcodes.each do |barcode|
  plate = Plate.create!({plate_barcode: barcode})
  seed_plates.push(plate)
end

# Seed tubes
tube_barcodes = []

Rails.logger.info "Seeding tubes"

# Seed wells & tubes
seed_plates.each do |plate|
  ROWS.each do |row|
    COLS.each do |col|
      Well.create!({
                     plate_barcode: plate.plate_barcode,
                     row: row,
                     column: col
                   })
      tube_barcode = "T-#{Faker::Barcode.ean(8)}"
      tube_barcodes.push(tube_barcode)
      Barcode.create!({barcode: tube_barcode})
      Tube.create!({
                     plate_barcode: plate.plate_barcode,
                     tube_barcode: tube_barcode,
                     sample: samples.sample
                   })
    end
  end
end