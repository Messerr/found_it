class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	session[:user_id] ? User.find(session[:user_id]) :nil
  	end

  	def current_post
  	 	params[:post_id] ? Post.find(params[:post_id]) :nil
  	end

  	def current_airport
  		params[:id] ? Airport.find(params[:id]) : nil
  	end

  
end
