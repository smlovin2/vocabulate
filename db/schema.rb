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

ActiveRecord::Schema.define(version: 20160217010138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "definitions", force: true do |t|
    t.string   "text"
    t.string   "part_of_speech"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "definitions", ["word_id"], name: "index_definitions_on_word_id", using: :btree

  create_table "saved_words", force: true do |t|
    t.integer  "word_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "word_list_id"
  end

  add_index "saved_words", ["word_id"], name: "index_saved_words_on_word_id", using: :btree
  add_index "saved_words", ["word_list_id"], name: "index_saved_words_on_word_list_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "word_lists", force: true do |t|
    t.boolean  "current_list"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_lists", ["user_id"], name: "index_word_lists_on_user_id", using: :btree

  create_table "words", force: true do |t|
    t.string   "word"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
