class Public::UsersController < ApplicationController
  
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
  
end
