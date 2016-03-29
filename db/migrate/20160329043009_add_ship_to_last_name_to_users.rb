class AddShipToLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_last_name, :string
  end
end
