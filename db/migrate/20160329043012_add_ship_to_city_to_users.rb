class AddShipToCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_city, :string
  end
end
