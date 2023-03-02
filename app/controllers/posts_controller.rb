class PostsController < ApplicationController
 
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
 

   def index
        @posts = Post.all
    end
    
    def show
        # @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
    end

    def edit
    end
    
    def create
      # @post = Post.new(post_params)
      # @post = current_user.posts.build(post_params)
        @post = current_user.posts.new(post_params)
        if @post.save
             redirect_to posts_path, notice: "投稿しました"
        else
          render :new
       end
    end

    def update
      if @post.update(post_params)
        redirect_to posts_path, notice: "更新しました"
      else
        render "edit", status: :unprocessable_entity
      end
    end
  

    def destroy
      @post.destroy
      redirect_to posts_path, notice: "削除しました", status: :see_other
    end
    

      # 画像アップロード用のアクション
    def upload_image
      @image_blob = create_blob(params[:image])
      render json: @image_blob
    end


    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title).merge(images: uploaded_images)
    end

    # アップロード済み画像の検索
    def uploaded_images
      params[:post][:images].drop(1).map{|id| ActiveStorage::Blob.find(id)} if params[:post][:images]
    end

    # blobデータの作成
    def create_blob(file)
      ActiveStorage::Blob.create_and_upload!(
        io: file.open,
        filename: file.original_filename,
        content_type: file.content_type
      )
    end

    def post_params
      # params.require(:post).permit(:content, images: [])
      params.require(:post).permit(:title, images_attributes: [:picture]).merge(user_id: current_user.id)
    end

    
    
end
