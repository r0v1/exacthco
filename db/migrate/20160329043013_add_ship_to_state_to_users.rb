class AddShipToStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ship_to_state, :string
  end
end
