class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if current_user != @user
      redirect_to :root
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Updated your profile!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :area, :password, :password_confirmation)
  end
  
  def find_user
    @user = User.find(params[:id])
  end
end
