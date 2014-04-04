class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Welcome back, #{user.full_name}"
      login_user!(user)
    else
      redirect_to login_path
      flash[:error] = "Sorry, something went wrong!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

private
  def login_user!(user)
    session[:user_id] = user.id
    redirect_to root_path
  end
end