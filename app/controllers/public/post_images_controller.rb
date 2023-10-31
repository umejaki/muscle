class Public::PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    pp "@post_image------------------------#{@post_image.inspect}"
    @user = @post_image.user
    @comment = Comment.new
    pp "@comment-----------------------------#{@comment.inspect}"
  end 
  
  def index
   if params[:post_keyword]
    @post_images = PostImage.where(['introduction LIKE(?) OR title LIKE(?)','%'+params[:post_keyword]+'%','%'+params[:post_keyword]+'%'])
   else 
    @post_images = PostImage.all  
    @tag = Tag.all
   end 
  end 
  
  def search_tag
    #検索されたタグを受け取る
    @tag = Tag.find(params[:id])
    #検索されたタグに紐づく投稿を表示
    @post_images = @tag.post_images
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
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to user_path
  end 
  
  private
  
    # ストロングパラメータ
  def post_image_params
    params.require(:post_image).permit(:image, :title, :introduction, tag_ids: [])
  end

end
