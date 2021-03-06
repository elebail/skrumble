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

ActiveRecord::Schema.define(version: 2019_06_13_171022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_events_on_country_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.string "icon"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_items_on_country_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "process_time"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.string "icon"
    t.index ["country_id"], name: "index_tasks_on_country_id"
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "task_id"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.index ["task_id"], name: "index_todos_on_task_id"
    t.index ["trip_id"], name: "index_todos_on_trip_id"
  end

  create_table "trip_events", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "event_id"
    t.boolean "interested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_trip_events_on_event_id"
    t.index ["trip_id"], name: "index_trip_events_on_trip_id"
  end

  create_table "trip_items", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "item_id"
    t.integer "quantity"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.index ["item_id"], name: "index_trip_items_on_item_id"
    t.index ["trip_id"], name: "index_trip_items_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted"
    t.integer "creator"
    t.index ["country_id"], name: "index_trips_on_country_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "countries"
  add_foreign_key "items", "countries"
  add_foreign_key "tasks", "countries"
  add_foreign_key "todos", "tasks"
  add_foreign_key "todos", "trips"
  add_foreign_key "trip_events", "events"
  add_foreign_key "trip_events", "trips"
  add_foreign_key "trip_items", "items"
  add_foreign_key "trip_items", "trips"
  add_foreign_key "trips", "countries"
  add_foreign_key "trips", "users"
end
