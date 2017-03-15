class CreateApitrans < ActiveRecord::Migration
  def change
    create_table :apitrans do |t|
      t.string :gateway_id, limit: 10
      t.string :password, limit: 30
      t.string :transaction_type, limit: 2
      t.float :amount
      t.string :cc_number, limit: 16
      t.string :cc_expiry, limit: 4
      t.string :cardholder_name, limit: 30
      t.string :cvd_code, limit: 4
      t.string :cvd_presence_ind, limit: 1
      t.string :cavv
      t.string :ecommerce_flag
      t.string :transarmor_token
      t.string :credit_card_type
      t.integer :transaction_tag

      t.timestamps null: false
    end
    add_index :apitrans, :transaction_tag
  end
end
