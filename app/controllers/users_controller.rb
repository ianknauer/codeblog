class UsersController < ApplicationController
  before_filter :require_user, only: [:new, :create]


  def new
    @user = User.new
  end

  def show
    @user = User.find_by(email: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end