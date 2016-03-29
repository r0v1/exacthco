class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :company, :address, :city, :state, :postal_code, :country, :home_phone, :cell_phone, :fax, :username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :company, :address, :city, :state, :postal_code, :country, :home_phone, :cell_phone, :fax, :username, :email, :password, :password_confirmation, :current_password, :ship_to_first_name, :ship_to_last_name, :ship_to_company, :ship_to_address, :ship_to_city, :ship_to_state, :ship_to_zip, :ship_to_country)
  end

end
