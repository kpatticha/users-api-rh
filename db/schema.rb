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

ActiveRecord::Schema.define(version: 20161001143411) do

  create_table "locations", force: :cascade do |t|
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.integer "zip"
    t.integer "user_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "user_id"
    t.text    "large"
    t.text    "medium"
    t.string  "thumbnail"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "gender"
    t.string  "title"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "username"
    t.string  "password"
    t.string  "salt"
    t.string  "md5"
    t.string  "sha1"
    t.text    "sha256"
    t.integer "registered"
    t.integer "dob"
    t.string  "phone"
    t.string  "cell"
    t.string  "PPS"
  end

end
