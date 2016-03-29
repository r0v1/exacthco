class AddShipToAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_address, :string
  end
end
