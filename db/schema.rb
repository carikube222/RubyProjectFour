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

ActiveRecord::Schema.define(version: 20170303022214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.string   "object"
    t.date     "startdate"
    t.date     "enddate"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_conditions_on_user_id", using: :btree
  end

  create_table "maybes", force: :cascade do |t|
    t.string   "content"
    t.integer  "condition_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["condition_id"], name: "index_maybes_on_condition_id", using: :btree
    t.index ["user_id"], name: "index_maybes_on_user_id", using: :btree
  end

  create_table "nopes", force: :cascade do |t|
    t.string   "content"
    t.integer  "condition_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["condition_id"], name: "index_nopes_on_condition_id", using: :btree
    t.index ["user_id"], name: "index_nopes_on_user_id", using: :btree
  end

  create_table "pantries", force: :cascade do |t|
    t.string   "url"
    t.string   "name"
    t.string   "title"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wines", force: :cascade do |t|
    t.string   "url"
    t.string   "name"
    t.string   "title"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yes", force: :cascade do |t|
    t.string   "content"
    t.integer  "condition_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["condition_id"], name: "index_yes_on_condition_id", using: :btree
    t.index ["user_id"], name: "index_yes_on_user_id", using: :btree
  end

  add_foreign_key "conditions", "users"
  add_foreign_key "maybes", "conditions"
  add_foreign_key "maybes", "users"
  add_foreign_key "nopes", "conditions"
  add_foreign_key "nopes", "users"
  add_foreign_key "yes", "conditions"
  add_foreign_key "yes", "users"
end
