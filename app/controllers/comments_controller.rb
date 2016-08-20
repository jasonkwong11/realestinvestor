class CommentsController < ApplicationController
  include PostsHelper, CommentsHelper

  def index
    @post = current_post_by_id
    @comments = @post.comments
  end

  def new
    @post = current_post_by_id
    @comment = Comment.new
  end

  def create
    @post = current_post_by_id
    @comment = create_comment
    redirect_to post_comments_path(@post)
  end
end
