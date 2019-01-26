module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_profile
    @current_profile ||= Profile.find_by(user_id: current_user.id)
  end

  def logged_in?
    current_user.present?
  end
end
