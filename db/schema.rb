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

ActiveRecord::Schema.define(version: 20180205230210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "memos", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.text "text_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "voice_file_file_name"
    t.string "voice_file_content_type"
    t.integer "voice_file_file_size"
    t.datetime "voice_file_updated_at"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "password_hash"
    t.string "password_salt"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token"
  end

  add_foreign_key "memos", "users"
end
