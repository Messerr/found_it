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
    @post.status = 'Unclaimed'
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

    def check
      post_id_param = params[:current_post]
      post_id = post_id_param.split('>').last
      the_post = post_id.at(0..1)
      params_answer = params[:post][:answer]
      check_post = Post.find(the_post)

      if check_post.answer == params_answer
        flash[:notice] = "#{check_post.user.fname}" + " " + "has been notified!"
        check_post.status = "Claimed"
        check_post.save
      else
        flash[:notice] = "WOMP! THATS WRONG!"
      end
 redirect_to post_path(the_post)

    end

  	private

    def current_airport
      params[:id] ? Airport.find(params[:id]) : nil
    end

  	def set_post 
  		@post = Post.find(params[:id])
  	end

  	def post_params
  		params.require(:post).permit(:item, :description, :location, :avatar, :airport_id, :airport_name, :status, :question, :answer).merge(user_id: current_user.id)
  	end
end
