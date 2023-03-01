class PostsController < ApplicationController
 
  before_action :set_post, only: [:show]
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
    
    def create
      # @post = Post.new(post_params)
      @post = current_user.posts.build(post_params)
        # @post = current_user.posts.new(post_params)
        if @post.save
          redirect_to @post, notice: "Post was successfully created."
        else
          render :new
       end
    end
    


    private

    def post_params
      # params.require(:post).permit(:content, images: [])
      params.require(:post).permit(:content, images_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find(params[:id])
    end
    
end
