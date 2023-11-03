class Admin::PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.page(params[:page]).per(6)
    @tag = Tag.all
  end 
  
  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
    @comments = @post_image.comments.page(params[:page]).per(4)
  end
  
  private
  def user_params
    params.require(:user).permit(:nick_name, :email, :is_deleted)
  end
  
end
