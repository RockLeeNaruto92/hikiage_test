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

ActiveRecord::Schema.define(version: 20170519103710) do

  create_table "actions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "test_column", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "scenario_actions", force: :cascade do |t|
    t.integer  "scenario_id",        limit: 4
    t.string   "action_test_column", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "scenario_actions", ["scenario_id", "action_test_column"], name: "index_scenario_actions_on_scenario_id_and_action_test_column", using: :btree

  create_table "scenarios", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "login_id",              limit: 255
    t.string   "password",              limit: 255
    t.string   "password_confirmation", limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
