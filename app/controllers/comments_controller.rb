
class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(content: params[:comment][:content], commenter: params[:comment][:commenter], post_id: @post.id, user_id: current_user.id)
    redirect_to post_comments_path(@post)
  end

private

  def comment_params
    params.require(:comment).permit(:content, :commenter, :user_id, :post_id, :time_created)
  end
end
