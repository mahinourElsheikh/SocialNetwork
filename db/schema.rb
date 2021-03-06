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

ActiveRecord::Schema.define(version: 20171219174914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "other_user_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "other_user_id"], name: "index_friend_requests_on_user_id_and_other_user_id", unique: true
  end

  create_table "friends", force: :cascade do |t|
    t.integer "user_id"
    t.integer "other_user_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["other_user_id"], name: "index_friends_on_other_user_id"
    t.index ["user_id", "other_user_id"], name: "index_friends_on_user_id_and_other_user_id", unique: true
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "caption"
    t.boolean "is_public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "picture"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "password_digest"
    t.string "email"
    t.integer "gender"
    t.integer "marital_status"
    t.date "birthdate"
    t.text "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.string "picture"
    t.boolean "admin", default: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "friend_requests", "users", column: "other_user_id", on_delete: :cascade
  add_foreign_key "friend_requests", "users", on_delete: :cascade
  add_foreign_key "friends", "users", column: "other_user_id", on_delete: :cascade
  add_foreign_key "friends", "users", on_delete: :cascade
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "phones", "users"
  add_foreign_key "posts", "users", on_delete: :cascade
  add_foreign_key "users", "cities"
end
