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

ActiveRecord::Schema.define(version: 20161229064219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_infos", force: :cascade do |t|
    t.text     "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contact_infos_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "contact_nick"
    t.string   "label"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_contacts_on_user_id", using: :btree
  end

  create_table "educations", force: :cascade do |t|
    t.string   "institute"
    t.string   "details"
    t.boolean  "active"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id", using: :btree
  end

  create_table "emails", force: :cascade do |t|
    t.string   "mail_address"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_emails_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.string   "followable_type",                 null: false
    t.integer  "followable_id",                   null: false
    t.string   "follower_type",                   null: false
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
    t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
  end

  create_table "hashtags", force: :cascade do |t|
    t.string   "tag1"
    t.string   "tag2"
    t.string   "tag3"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hashtags_on_user_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.string   "interest"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interests_on_user_id", using: :btree
  end

  create_table "labels", force: :cascade do |t|
    t.string   "name"
    t.string   "field"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_labels_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "current_city"
    t.string   "hometown"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "phones", force: :cascade do |t|
    t.string   "num"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phones_on_user_id", using: :btree
  end

  create_table "social_infos", force: :cascade do |t|
    t.string   "website"
    t.string   "fb"
    t.string   "linkedin"
    t.string   "twitter"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_infos_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nick"
    t.text     "intro"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.string   "company"
    t.string   "details"
    t.boolean  "active"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_works_on_user_id", using: :btree
  end

  add_foreign_key "contact_infos", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "emails", "users"
  add_foreign_key "hashtags", "users"
  add_foreign_key "interests", "users"
  add_foreign_key "labels", "users"
  add_foreign_key "locations", "users"
  add_foreign_key "phones", "users"
  add_foreign_key "social_infos", "users"
  add_foreign_key "works", "users"
end
