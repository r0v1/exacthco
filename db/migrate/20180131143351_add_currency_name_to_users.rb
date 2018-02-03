class AddCurrencyNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :currency_name, :string
  end
end
