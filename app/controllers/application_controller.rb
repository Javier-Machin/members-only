class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def log_in(user)
    session[:user_id] = user.id
    current_user(user.id)
  end
  
  def current_user=(user)
    current_user = user 
  end

  def current_user
    current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def log_out
    forget(current_user)
    cookies.delete(:remember_token)
    current_user = nil
  end

end
