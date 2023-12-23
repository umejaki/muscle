class Admin::PostImagesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @post_images = PostImage.page(params[:page]).per(6)
    @tag = Tag.all
  end 
  
  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
    @comments = @post_image.comments.page(params[:page]).per(4)
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admin_user_path(@post_image.user_id)
  end 
  
  private
  def user_params
    params.require(:user).permit(:nick_name, :email, :is_deleted)
  end
  
end
