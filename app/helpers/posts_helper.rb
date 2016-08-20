module PostsHelper
  def current_post
    Post.find(params[:id])
  end

  def create_post
    @post.user_id = current_user.id
    current_user.post_count += 1
    current_user.save
    @post.save
    redirect_to @post
  end
end
