class PostsController < ApplicationController
before_action :authenticate_user!
include PostsHelper

  def index
    if !!current_user
      @posts = Post.all
      @posts = @posts.reverse
    else
      redirect_to root_path :alert => "Access denied."
    end
  end

  def show
    @post = current_post
  end

  def new
    @post = Post.new
    add_property_details
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      create_post
    else
      render :new
    end
  end

  def edit
    @post = current_post
  end

  def update
    @post = current_post
    @post.update(post_params)
    redirect_to post_path
  end

  def destroy
    search_and_destroy_post
    redirect_to posts_path
  end

end
