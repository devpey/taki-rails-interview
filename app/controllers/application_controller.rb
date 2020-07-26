class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception


  #include SessionsHelper

  # make this methods accessible in view
  #helper_method :current_user, :current_business

  def current_business
    @current_business ||= Business.find_by(user_id: current_user.id)
  end

  protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :current_password, :password, :password_confirmation)}

  end

  # authenticate user for all controllers and all actions
  # unless specified otherwise in each controller
  # before_action :authenticate_user

  # authenticate user function, redirect to login page if not logged in
  #def authenticate_user
   # redirect_to login_path, notice: "Please login first" if current_user.blank?
  #end
end
