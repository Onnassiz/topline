# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_11_054248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shirt_colors", force: :cascade do |t|
    t.bigint "shirt_id"
    t.bigint "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_shirt_colors_on_color_id"
    t.index ["shirt_id"], name: "index_shirt_colors_on_shirt_id"
  end

  create_table "shirt_sizes", force: :cascade do |t|
    t.bigint "shirt_id"
    t.bigint "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shirt_id"], name: "index_shirt_sizes_on_shirt_id"
    t.index ["size_id"], name: "index_shirt_sizes_on_size_id"
  end

  create_table "shirts", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.boolean "in_stock"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_link"
    t.integer "total_item"
    t.index ["brand_id"], name: "index_shirts_on_brand_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shirt_colors", "colors"
  add_foreign_key "shirt_colors", "shirts"
  add_foreign_key "shirt_sizes", "shirts"
  add_foreign_key "shirt_sizes", "sizes"
  add_foreign_key "shirts", "brands"
end
