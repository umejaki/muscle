class Public::CommentsController < ApplicationController
  
  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_image_id = @post_image.id
    @comment.user_id = current_user.id
    #binding.pry
    if @comment.save
      redirect_to post_image_path(@post_image.id)
    else
    @user = @post_image.user
    @comments = @post_image.comments.page(params[:page]).per(4)
      flash[:alert] = "投稿に失敗しました"
    #  redirect_to post_image_path(@post_image.id)
      render "public/post_images/show"
    end
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  
end
