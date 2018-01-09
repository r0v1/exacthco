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

ActiveRecord::Schema.define(version: 20180109193910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "apitrans", force: :cascade do |t|
    t.string   "gateway_id",       limit: 10
    t.string   "password",         limit: 30
    t.string   "transaction_type", limit: 2
    t.float    "amount"
    t.string   "cc_number",        limit: 16
    t.string   "cc_expiry",        limit: 4
    t.string   "cardholder_name",  limit: 30
    t.string   "cvd_code",         limit: 4
    t.string   "cvd_presence_ind", limit: 1
    t.string   "cavv"
    t.string   "ecommerce_flag"
    t.string   "transarmor_token"
    t.string   "credit_card_type"
    t.integer  "transaction_tag"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "apitrans", ["transaction_tag"], name: "index_apitrans_on_transaction_tag", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "category"
    t.string   "subcategory"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "price",       precision: 9, scale: 2
  end

  create_table "relays", force: :cascade do |t|
    t.string   "x_show_form"
    t.string   "x_tax_exempt"
    t.string   "x_zip"
    t.string   "exact_wsp_version"
    t.string   "x_auth_code"
    t.string   "x_ship_to_last_name"
    t.string   "x_fax"
    t.string   "x_company"
    t.string   "exact_issname"
    t.string   "x_login"
    t.string   "x_amount"
    t.string   "x_description"
    t.string   "x_avs_code"
    t.string   "x_ship_to_company"
    t.string   "x_last_name"
    t.string   "x_method"
    t.string   "x_currency_code"
    t.string   "x_ship_to_first_name"
    t.string   "x_ship_to_state"
    t.string   "x_ship_to_city"
    t.string   "x_address"
    t.string   "x_freight"
    t.string   "exact_issconf"
    t.string   "x_fp_sequence"
    t.string   "x_first_name"
    t.string   "x_response_subcode"
    t.string   "x_invoice_num"
    t.string   "x_fp_timestamp"
    t.string   "x_response_code"
    t.string   "x_trans_id"
    t.string   "x_tax"
    t.string   "x_email"
    t.string   "x_city"
    t.string   "x_cvv2_resp_code"
    t.string   "x_country"
    t.string   "x_ship_to_country"
    t.string   "x_phone"
    t.string   "x_ship_to_address"
    t.string   "x_cavv_response"
    t.string   "x_response_reason_code"
    t.string   "x_duty"
    t.string   "x_reference_3"
    t.text     "exact_ctr"
    t.string   "x_cust_id"
    t.string   "x_type"
    t.string   "x_po_num"
    t.string   "x_state"
    t.string   "x_ship_to_zip"
    t.string   "x_response_reason_text"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "tax2_amount"
    t.string   "tax1_amount"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "fax"
    t.boolean  "admin",                  default: false
    t.string   "ship_to_first_name"
    t.string   "ship_to_last_name"
    t.string   "ship_to_company"
    t.string   "ship_to_address"
    t.string   "ship_to_city"
    t.string   "ship_to_state"
    t.string   "ship_to_zip"
    t.string   "ship_to_country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
