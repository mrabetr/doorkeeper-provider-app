# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  # protect_from_forgery with: :null_session
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_account_update_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:name)
  # end

  # def configure_account_update_parameters
  #   devise_parameter_sanitizer.permit(:name)
  # end
end
