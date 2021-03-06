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

ActiveRecord::Schema.define(version: 2019_08_29_153242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crowds", force: :cascade do |t|
    t.bigint "event_id"
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_crowds_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "datetime"
    t.string "event_type"
    t.string "description"
    t.string "event_location"
    t.string "meeting_location"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.boolean "public", default: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "mobfriend_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "crowd_id"
    t.index ["crowd_id"], name: "index_jobs_on_crowd_id"
    t.index ["event_id"], name: "index_jobs_on_event_id"
    t.index ["mobfriend_id"], name: "index_jobs_on_mobfriend_id"
  end

  create_table "mobfriends", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "tagline"
    t.string "bio"
    t.integer "age"
    t.string "gender"
    t.string "language"
    t.integer "hourly_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_mobfriends_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "crowds", "events"
  add_foreign_key "events", "users"
  add_foreign_key "jobs", "crowds"
  add_foreign_key "jobs", "events"
  add_foreign_key "jobs", "mobfriends"
  add_foreign_key "mobfriends", "users"
end
