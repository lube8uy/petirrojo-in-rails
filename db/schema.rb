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

ActiveRecord::Schema.define(:version => 20120726012347) do

  create_table "trends", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.integer  "clicks"
  end

  add_index "trends", ["name"], :name => "index_trends_on_name", :unique => true

  create_table "twiterers", :force => true do |t|
    t.integer  "twitter_id"
    t.integer  "friends_count"
    t.string   "profile_image_url"
    t.string   "location"
    t.text     "description",       :limit => 16777215
    t.string   "lang"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "name",              :limit => 140
  end

  create_table "twits", :force => true do |t|
    t.integer  "twitter_id"
    t.datetime "created_at"
    t.string   "from_user"
    t.integer  "from_user_id"
    t.string   "from_user_name"
    t.string   "iso_language_code"
    t.string   "profile_image_url"
    t.text     "source",            :limit => 16777215
    t.string   "body"
    t.string   "to_user"
    t.integer  "to_user_id"
    t.string   "to_user_name"
  end

end
