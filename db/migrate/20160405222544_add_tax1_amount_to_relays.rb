class AddTax1AmountToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :tax1_amount, :string
  end
end
