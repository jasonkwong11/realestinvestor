class UsersController < ApplicationController
before_action :authenticate_user!
include PostsHelper, UsersHelper

  def new
     @user = User.new
   end
   
   def create
     @user = User.create(post_params)
     session[:user_id] = @user.id  
     redirect_to @user
   end
   
   def show
     @user = User.find(params[:id])
   end 
   
   def signin
     @user = User.new
   end
   
   def signout
     session.clear
     redirect_to '/'
   end
   
   def begin_new_session
     set_current_session
     user = User.find(session[:user_id])
     redirect_to user
   end
end
