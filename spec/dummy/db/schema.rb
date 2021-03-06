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

ActiveRecord::Schema.define(version: 20140809204930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "child_resources", force: true do |t|
    t.integer  "parent_resource_id"
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diff_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grand_child_resources", force: true do |t|
    t.integer  "child_resource_id"
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "handler_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.integer  "create_count",             default: 0,     null: false
    t.integer  "accept_count",             default: 0,     null: false
    t.integer  "decline_count",            default: 0,     null: false
    t.integer  "created_revisions_count",  default: 0,     null: false
    t.integer  "accepted_revisions_count", default: 0,     null: false
    t.integer  "declined_revisions_count", default: 0,     null: false
    t.boolean  "has_been_created",         default: false, null: false
    t.boolean  "accepted",                 default: false, null: false
    t.boolean  "declined",                 default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nonversionable_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parent_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partially_exclusive_versionable_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partially_inclusive_versionable_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubber_stamp_diff_attributes", force: true do |t|
    t.integer "version_attribute_id",                 null: false
    t.integer "index"
    t.string  "text"
    t.boolean "deletion",             default: false, null: false
  end

  add_index "rubber_stamp_diff_attributes", ["deletion"], name: "index_rubber_stamp_diff_attributes_on_deletion", using: :btree
  add_index "rubber_stamp_diff_attributes", ["index"], name: "index_rubber_stamp_diff_attributes_on_index", using: :btree
  add_index "rubber_stamp_diff_attributes", ["version_attribute_id"], name: "rubber_stamp_diff_attriubtes_on_attribute", using: :btree

  create_table "rubber_stamp_version_attributes", force: true do |t|
    t.string  "version_type", null: false
    t.integer "version_id",   null: false
    t.string  "name",         null: false
    t.text    "old_value"
    t.text    "new_value"
  end

  add_index "rubber_stamp_version_attributes", ["version_type", "version_id"], name: "rubber_stamp_version_attriubtes_on_version", using: :btree

  create_table "rubber_stamp_version_children", force: true do |t|
    t.string  "version_type",                       null: false
    t.integer "version_id",                         null: false
    t.string  "versionable_type"
    t.integer "versionable_id"
    t.string  "association_name",                   null: false
    t.boolean "marked_for_removal", default: false, null: false
  end

  add_index "rubber_stamp_version_children", ["association_name"], name: "rubber_stamp_version_children_on_association", using: :btree
  add_index "rubber_stamp_version_children", ["version_type", "version_id"], name: "rubber_stamp_version_children_on_version", using: :btree
  add_index "rubber_stamp_version_children", ["versionable_type", "versionable_id"], name: "rubber_stamp_version_children_on_versionable", using: :btree

  create_table "rubber_stamp_versions", force: true do |t|
    t.string   "versionable_type",                   null: false
    t.integer  "versionable_id",                     null: false
    t.integer  "user_id"
    t.text     "notes"
    t.boolean  "initial",            default: false, null: false
    t.boolean  "marked_for_removal", default: false, null: false
    t.boolean  "accepted",           default: false, null: false
    t.boolean  "declined",           default: false, null: false
    t.boolean  "pending",            default: true,  null: false
    t.datetime "created_at"
    t.datetime "accepted_at"
  end

  add_index "rubber_stamp_versions", ["accepted"], name: "index_rubber_stamp_versions_on_accepted", using: :btree
  add_index "rubber_stamp_versions", ["accepted_at"], name: "index_rubber_stamp_versions_on_accepted_at", using: :btree
  add_index "rubber_stamp_versions", ["created_at"], name: "index_rubber_stamp_versions_on_created_at", using: :btree
  add_index "rubber_stamp_versions", ["declined"], name: "index_rubber_stamp_versions_on_declined", using: :btree
  add_index "rubber_stamp_versions", ["initial"], name: "index_rubber_stamp_versions_on_initial", using: :btree
  add_index "rubber_stamp_versions", ["pending"], name: "index_rubber_stamp_versions_on_pending", using: :btree
  add_index "rubber_stamp_versions", ["versionable_type", "versionable_id"], name: "rubber_stamp_versions_on_versionable", using: :btree

  create_table "users", force: true do |t|
    t.string "name", null: false
  end

  create_table "validating_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versionable_resources", force: true do |t|
    t.boolean  "r_boolean"
    t.date     "r_date"
    t.datetime "r_datetime"
    t.decimal  "r_decimal"
    t.float    "r_float"
    t.integer  "r_integer"
    t.string   "r_string"
    t.text     "r_text"
    t.time     "r_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
