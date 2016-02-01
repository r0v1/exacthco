class CreateRelays < ActiveRecord::Migration
  def change
    create_table :relays do |t|
      t.string :x_show_form
      t.string :x_tax_exempt
      t.string :x_zip
      t.string :exact_wsp_version
      t.string :x_auth_code
      t.string :x_ship_to_last_name
      t.string :x_fax
      t.string :x_company
      t.string :exact_issname
      t.string :x_login
      t.string :x_amount
      t.string :x_description
      t.string :x_avs_code
      t.string :x_ship_to_company
      t.string :x_last_name
      t.string :x_method
      t.string :x_currency_code
      t.string :x_ship_to_first_name
      t.string :x_ship_to_state
      t.string :x_ship_to_city
      t.string :x_address
      t.string :x_freight
      t.string :exact_issconf
      t.string :x_fp_sequence
      t.string :x_first_name
      t.string :x_response_subcode
      t.string :x_invoice_num
      t.string :x_fp_timestamp
      t.string :x_response_code
      t.string :x_trans_id
      t.string :x_tax
      t.string :x_email
      t.string :x_city
      t.string :x_cvv2_resp_code
      t.string :x_country
      t.string :x_ship_to_country
      t.string :x_phone
      t.string :x_ship_to_address
      t.string :x_cavv_response
      t.string :x_response_reason_code
      t.string :x_duty
      t.string :x_reference_3
      t.text :exact_ctr
      t.string :x_cust_id
      t.string :x_type
      t.string :x_po_num
      t.string :x_state
      t.string :x_ship_to_zip
      t.string :x_response_reason_text

      t.timestamps null: false
    end
  end
end
