class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :company, :address, :city, :state, :postal_code, :country, :home_phone, :cell_phone, :fax, :username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :company, :address, :city, :state, :postal_code, :country, :home_phone, :cell_phone, :fax, :username, :email, :password, :password_confirmation, :current_password)
  end

end
