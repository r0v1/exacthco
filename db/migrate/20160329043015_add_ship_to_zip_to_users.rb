class AddShipToZipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_zip, :string
  end
end
