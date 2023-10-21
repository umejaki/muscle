class Public::PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  def show
    @post_image = PostImage.find(params[:id])  
    @user = current_user
    @comment = Comment.new
  end 
  
  def index
    @post_images = PostImage.all  
    @user = current_user
  end 
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
   if @post_image.save!
    # 4. リダイレクト
    redirect_to post_image_path(@post_image.id)
   else
    render :new
   end 
  end
  
  private
  
    # ストロングパラメータ
  def post_image_params
    params.require(:post_image).permit(:image, :title, :introduction)
  end
  
end
