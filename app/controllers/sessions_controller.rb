class SessionsController < ApplicationController

  def new
    @user = User.new
    @user.email = cookies[:email]
  end

  def create
    input_email = params[:user][:email]
    if User.exists?(email: input_email)
      @user = User.find_by(email: input_email)
      if @user.password === params[:user][:encrypted_password]
        session[:user_id] = @user.id
        cookies[:email] = @user.email
        redirect_to @user
      else
        flash[:alert] = "Wrong password!"
        redirect_to new_session_path
      end
    else
      flash[:alert] = "That user doesn't exist!"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end

end
