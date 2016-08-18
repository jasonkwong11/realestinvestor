class PostsController < ApplicationController
before_action :authenticate_user!

  def index
    if current_user
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
    @post.properties.build(post_id: @post.id)
  end

  def create
    @post = Post.create(post_params)
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
    params.require(:post).permit(:title, :content, :property_ids => [], :properties_attributes => [:name, :city, :condition, :price])
  end

  def current_post
    Post.find(params[:id])
  end

end
