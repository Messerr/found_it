class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  def index
  	@users = User.all

  end

  def new
  	@user = User.new
  end

  def edit
    @user = current_user
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
  	   redirect_to @user, notice: "New user created."
    else 
      render :new
    end

  end

  def update
     if @user.update(user_params)
      redirect_to @user, notice: "User successfully updated."
    else 
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to logout_path
  end

  

  private

  def current_user
  		session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :bio, :email, :password, :image, :avatar)
  end
end
