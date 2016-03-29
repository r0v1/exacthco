class AddShipToCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_company, :string
  end
end
