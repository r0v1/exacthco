class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, precision: 9, scale: 2
  end
end
