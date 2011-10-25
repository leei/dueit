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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110922233039) do

  create_table "accounts", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token", :unique => true

  create_table "homework", :force => true do |t|
    t.string   "name"
    t.text     "criteria"
    t.datetime "deadline"
    t.string   "state"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homework", ["deadline"], :name => "index_homeworks_on_deadline"
  add_index "homework", ["owner_id"], :name => "index_homeworks_on_owner_id"

  create_table "klasses", :force => true do |t|
    t.string   "name"
    t.string   "school"
    t.string   "teacher"
    t.integer  "year"
    t.string   "term"
    t.string   "period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klasses", ["name"], :name => "index_klasses_on_name"
  add_index "klasses", ["school"], :name => "index_klasses_on_school"
  add_index "klasses", ["teacher"], :name => "index_klasses_on_teacher"
  add_index "klasses", ["year"], :name => "index_klasses_on_year"

  create_table "members", :force => true do |t|
    t.integer  "klass_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["klass_id"], :name => "index_members_on_klass_id"
  add_index "members", ["user_id"], :name => "index_members_on_user_id"

end
