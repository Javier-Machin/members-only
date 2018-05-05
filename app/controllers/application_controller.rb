class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def log_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    cookies.permanent[:user_id] = user.id
    current_user
  end
  
  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def current_user?(user)
    user == @current_user
  end

  def log_out
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
    @current_user = nil
  end

end
