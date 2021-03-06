module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    current_user.nil?
  end

  # Returns the current logged-in user (if any).
  #def current_user
  #  @current_user ||= User.find_by(id: current_user.id)
    #@business = 
  #end

  # Returns the current Business logged-in user (if any).
  def current_business
    if current_user.present?
      @current_business ||=Business.find_by(user_id: current_user.id)
    end
  end
end
