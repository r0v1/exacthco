class AddCurrencyCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :currency_code, :string, limit: 3
  end
end
