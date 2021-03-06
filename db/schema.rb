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

ActiveRecord::Schema.define(version: 20181219113152) do

  create_table "characters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contents"
    t.integer  "content"
    t.integer  "game_id"
    t.string   "l_name"
    t.string   "f_name"
    t.string   "l_kana"
    t.string   "f_kana"
    t.string   "roma"
    t.string   "search_word"
    t.integer  "cv_id"
    t.integer  "idol_type"
    t.integer  "age"
    t.integer  "height"
    t.integer  "weight"
    t.string   "birthday"
    t.string   "blood_type"
    t.integer  "bust"
    t.integer  "waist"
    t.integer  "hip"
    t.string   "constellation"
    t.string   "handedness"
    t.string   "color"
    t.text     "description",   limit: 65535
    t.text     "memo",          limit: 65535
    t.string   "domain"
    t.integer  "position"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "domains", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
