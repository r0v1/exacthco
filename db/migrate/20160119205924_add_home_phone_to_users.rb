class AddHomePhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :home_phone, :string
  end
end
