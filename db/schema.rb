# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150325161804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "service_assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "assignment_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "service_assignments", ["service_id"], name: "index_service_assignments_on_service_id", using: :btree
  add_index "service_assignments", ["user_id"], name: "index_service_assignments_on_user_id", using: :btree

  create_table "services", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.string   "organization_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
