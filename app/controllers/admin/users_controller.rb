class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
  end 
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def post_image
    @user = User.find(params[:user_id])
    @post_images = @user.post_images.all
  end 
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path
  end 
  
  private
  def user_params
    params.require(:user).permit(:nick_name, :email, :is_deleted)
  end
  
end
