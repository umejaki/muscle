class Public::PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    pp "@post_image------------------------#{@post_image.inspect}"
    @user = current_user
    @comment = Comment.new
    pp "@comment-----------------------------#{@comment.inspect}"
  end 
  
  def index
   if params[:post_keyword]
    @post_images = PostImage.where(['introduction LIKE(?) OR title LIKE(?)','%'+params[:post_keyword]+'%','%'+params[:post_keyword]+'%'])
    @user = current_user
   else 
    @post_images = PostImage.all  
    @user = current_user
   end 
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
    params.require(:post_image).permit(:image, :title, :introduction, tag_ids: [])
  end

end
