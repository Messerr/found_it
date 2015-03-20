class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update, :show, :destroy]
  def index
  	@posts = Post.all
  end

  def new
  	if current_user
  		@post = Post.new
  	else
  		flash[:notice] = "Please sign in first."
  		redirect_to signin_path
  	end
  end

  def edit
  end

  def show
  end

  def create 
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post, notice: "New post created"
  	else
  		render :new 
  	end
  end

  	def destroy
  		@post.destroy
  		redirect_to posts_path, notice: "Post deleted"
  	end

    def update
      @post.update(post_params)
      redirect_to @post, notice: "Post succesfully updated."
    end

  	private

  	def set_post 
  		@post = Post.find(params[:id])
  	end

  	def post_params
  		params.require(:post).permit(:item, :description, :location, :avatar, :airport_id, :airport_name).merge(user_id: current_user.id)
  	end
end
