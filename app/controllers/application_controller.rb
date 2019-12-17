class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, fallback: :none
  
  before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :avatar, :cell_number, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :avatar, :cell_number, :email, :password)}
    end
end
