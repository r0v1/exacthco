class AddXFirstNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :x_first_name, :string
  end
end
