class AddTax2AmountToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :tax2_amount, :string
  end
end
