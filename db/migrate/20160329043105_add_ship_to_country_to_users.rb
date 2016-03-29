class AddShipToCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_country, :string
  end
end
