class Admin::PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.all
    @tag = Tag.all
  end 
  
  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
  end
  
  private
  def user_params
    params.require(:user).permit(:nick_name, :email, :is_deleted)
  end
  
end
