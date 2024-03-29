class Public::PostImagesController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @post_image = PostImage.new
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
    @comment = Comment.new
    @comments = @post_image.comments.order(created_at: :desc).page(params[:page]).per(4)
  end 
  
  def index
   if params[:post_keyword]
    @post_images = PostImage.where(['introduction LIKE(?) OR title LIKE(?)','%'+params[:post_keyword]+'%','%'+params[:post_keyword]+'%']).page(params[:page]).per(6)
    @tag = Tag.all
   else 
    @post_images = PostImage.order(created_at: :desc).page(params[:page]).per(6)
    @tag = Tag.all
   end 
  end 
  
  def edit
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
    @comments = @post_image.comments.page(params[:page]).per(4)
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
   if @post_image.save
    redirect_to post_image_path(@post_image.id)
   else
    render :new
   end 
  end
  
  def update
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
    @comments = @post_image.comments.page(params[:page]).per(4)
    if @post_image.update(post_image_params)
      redirect_to post_images_path(@post_image.id)
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to user_path
  end 
  
  private
  
   def post_image_params
     params.require(:post_image).permit(:image, :title, :image, :introduction, tag_ids: [])
   end

end
