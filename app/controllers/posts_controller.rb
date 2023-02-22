class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
    end
    
    def create
      # @post = Post.new(post_params)
      @post = current_user.posts.build(post_params)
        if @post.save
          redirect_to @post, notice: "Post was successfully created."
        else
          render :new
       end
    end
    
    private

    def post_params
      params.require(:post).permit(:image, :content)
    end
    
end
