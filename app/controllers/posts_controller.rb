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
    @post.properties.build(post_id: @post.id)
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
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    redirect_to post_path
  end

  def destroy
    @post = current_post
    @post.destroy
    @post.save
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :property_ids => [], :properties_attributes => [:name, :city, :condition, :price])
  end

  def top_contributer
    User.top_contributer
  end

end
