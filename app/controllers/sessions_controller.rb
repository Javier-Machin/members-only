class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])   
      @user.generate_token
      @user.save
      log_in(@user)
      
      redirect_to new_post_path
    else
      render 'new'
    end
  end

  def destroy
    log_out 
  end

end
