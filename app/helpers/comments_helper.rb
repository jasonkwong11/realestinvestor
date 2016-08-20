module CommentsHelper

  def create_comment
    @post.comments.create(content: params[:comment][:content], commenter: params[:comment][:commenter], post_id: @post.id, user_id: current_user.id)
  end

private

  def comment_params
    params.require(:comment).permit(:content, :commenter, :user_id, :post_id, :time_created)
  end
end
