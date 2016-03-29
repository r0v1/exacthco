class AddShipToFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_first_name, :string
  end
end
