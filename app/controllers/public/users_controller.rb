class Public::UsersController < ApplicationController
  before_action :user, only: [:favorites]
  
  def favorites
    favorited_post_image_id = Favorite.where(user_id: @user.id).pluck(:post_image_id)
    @favorites_post_images = PostImage.where(id: favorited_post_image_id)
  end 
  
  def edit
    @user = current_user
  end
  
  def show
    @user = current_user
  end
  
  def unsubscribe
    @user = current_user
  end
  
  def withdraw
    @user = User.find(current_customer.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end 
  
  def update
    @user = current_user
    @cuser.update(user_params)
    redirect_to user_path
  end 
  
    protected
    
    def user_params
      params.require(:user).permit(:nick_name, :is_deleted)
    end
    
    def user
      @user = User.find(params[:id])
    end

  
end
