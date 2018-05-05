class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])   
      @user.generate_token
      log_in @user
      cookies.permanent[:remember_token] = @user.remember_token
      cookies.permanent[:user_id] = @user.id
      redirect_to new_post_path
    end
  end

  def destroy
    log_out 
  end

end
