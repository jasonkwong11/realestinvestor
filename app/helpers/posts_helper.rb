module PostsHelper
  def current_post
    Post.find(params[:id])
  end

  def current_post_by_id
    Post.find(params[:post_id])
  end

  def create_post
    @post.user_id = current_user.id
    current_user.post_count += 1
    current_user.save
    @post.save
    redirect_to @post
  end

  def search_and_destroy_post
    @post = current_post
    @post.destroy
    @post.save
  end

  def add_property_details
    @post.properties.build(post_id: @post.id)
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :property_ids => [], :properties_attributes => [:name, :city, :condition, :price])
  end

  def top_contributer
    User.top_contributer
  end
end
