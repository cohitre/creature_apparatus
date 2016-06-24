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

ActiveRecord::Schema.define(version: 20160622174610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "character_captures", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.uuid     "player_id",    null: false
    t.uuid     "character_id", null: false
  end

  create_table "characters", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "display_name", null: false
    t.integer  "capture_rate", null: false
  end

  add_index "characters", ["display_name"], name: "index_characters_on_display_name", unique: true, using: :btree

  create_table "encounter_environments", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name",           null: false
    t.string   "encounter_rate", null: false
  end

  add_index "encounter_environments", ["name"], name: "index_encounter_environments_on_name", unique: true, using: :btree

  create_table "environment_memberships", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.uuid     "encounter_environment_id", null: false
    t.uuid     "character_id",             null: false
    t.integer  "probability",              null: false
  end

  add_index "environment_memberships", ["encounter_environment_id", "character_id"], name: "index_environment_memberships_on_environment_and_character", unique: true, using: :btree

  create_table "player_aliases", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "value",      null: false
    t.uuid     "player_id",  null: false
  end

  add_index "player_aliases", ["value"], name: "index_player_aliases_on_value", unique: true, using: :btree

  create_table "players", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "display_name", null: false
  end

  add_index "players", ["display_name"], name: "index_players_on_display_name", unique: true, using: :btree

end
