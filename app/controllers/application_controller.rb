class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  protected

    def configure_permitted_parameters
      sign_up_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      account_update_attrs = [:email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: account_update_attrs)
    end
end
