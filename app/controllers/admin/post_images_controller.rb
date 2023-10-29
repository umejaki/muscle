class Admin::PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.all
    @use = User.all
    @tag = Tag.all
  end 
  
  def post_image
    @user = User.find(params[:id])
    @post_images = @user.post_images.all
  end 
  
end
