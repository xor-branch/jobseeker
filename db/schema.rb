# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_01_185342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "obtention_year"
    t.string "school"
    t.bigint "profil_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profil_id"], name: "index_academics_on_profil_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.boolean "entreprise", default: false, null: false
    t.boolean "jobseeker", default: false, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applies", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_applies_on_account_id"
    t.index ["post_id"], name: "index_applies_on_post_id"
  end

  create_table "compagnies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website"
    t.string "facebook"
    t.string "linkedin"
    t.string "twitter"
    t.integer "country_id"
    t.integer "state_id"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_compagnies_on_account_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.bigint "profil_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profil_id"], name: "index_experiences_on_profil_id"
  end

  create_table "hobbies", force: :cascade do |t|
    t.string "name"
    t.bigint "profil_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profil_id"], name: "index_hobbies_on_profil_id"
  end

  create_table "personals", force: :cascade do |t|
    t.integer "gender"
    t.integer "marital_statut"
    t.integer "children"
    t.date "birth_day"
    t.string "language"
    t.bigint "profil_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profil_id"], name: "index_personals_on_profil_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "portfolio_link", default: "#"
    t.bigint "profil_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profil_id"], name: "index_portfolios_on_profil_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "category"
    t.string "title"
    t.text "description"
    t.integer "jobtype"
    t.date "deadline"
    t.integer "min_salary"
    t.integer "max_salary"
    t.string "frequence"
    t.integer "state_id"
    t.bigint "account_id", null: false
    t.boolean "terms_use"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_posts_on_account_id"
  end

  create_table "profils", force: :cascade do |t|
    t.string "name"
    t.string "speciality"
    t.text "bio"
    t.integer "telephone"
    t.integer "country_id"
    t.integer "state_id"
    t.boolean "asc_certificat"
    t.boolean "terms_use"
    t.string "facebook"
    t.string "twitter"
    t.string "linkedin"
    t.string "github"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_profils_on_account_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "profil_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profil_id"], name: "index_skills_on_profil_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "academics", "profils"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applies", "accounts"
  add_foreign_key "applies", "posts"
  add_foreign_key "compagnies", "accounts"
  add_foreign_key "experiences", "profils"
  add_foreign_key "hobbies", "profils"
  add_foreign_key "personals", "profils"
  add_foreign_key "portfolios", "profils"
  add_foreign_key "posts", "accounts"
  add_foreign_key "profils", "accounts"
  add_foreign_key "skills", "profils"
end
