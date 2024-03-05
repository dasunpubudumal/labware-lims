# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_05_102807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barcodes", primary_key: "barcode", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plates", primary_key: "plate_barcode", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plate_barcode"], name: "index_plates_on_plate_barcode"
  end

  create_table "sample_transfer_histories", force: :cascade do |t|
    t.string "sample_id"
    t.string "source_tube"
    t.string "destination_tube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samples", primary_key: "sanger_sample_id", id: :string, default: -> { "nextval('sanger_sample_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "sample_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_samples_on_customer_id"
  end

  create_table "tubes", primary_key: "tube_barcode", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plate_barcode"
    t.string "sanger_sample_id"
    t.index ["plate_barcode"], name: "index_tubes_on_plate_barcode"
    t.index ["sanger_sample_id"], name: "index_tubes_on_sanger_sample_id"
    t.index ["tube_barcode"], name: "index_tubes_on_tube_barcode"
  end

  create_table "wells", primary_key: ["row", "column", "plate_barcode"], force: :cascade do |t|
    t.integer "row", null: false
    t.string "column", null: false
    t.string "plate_barcode", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plate_barcode"], name: "new_index_wells_on_plate_barcode"
  end

  add_foreign_key "plates", "barcodes", column: "plate_barcode", primary_key: "barcode", name: "plate_barcode"
  add_foreign_key "samples", "customers", name: "customer_id"
  add_foreign_key "tubes", "barcodes", column: "tube_barcode", primary_key: "barcode", name: "tube_barcode"
  add_foreign_key "tubes", "plates", column: "plate_barcode", primary_key: "plate_barcode", name: "plate_barcode"
  add_foreign_key "tubes", "samples", column: "sanger_sample_id", primary_key: "sanger_sample_id", name: "sanger_sample_id"
  add_foreign_key "wells", "plates", column: "plate_barcode", primary_key: "plate_barcode"
end
