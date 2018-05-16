class CommentsController < ApplicationController
  before_action :require_login

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
