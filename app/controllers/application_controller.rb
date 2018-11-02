class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def log_in(user)
    cookies.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    current_user
    #set current_user from the cookie
  end
  
  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def log_out
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  helper_method :logged_in?
end
