class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = current_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params)
    redirect_to @post
  end

  def edit
    @post = current_post
  end

  def update
    @post = current_post
    @post.update(post_params)
    redirect_to post_path
  end

private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def current_post
    Post.find(params[:id])
  end

end
