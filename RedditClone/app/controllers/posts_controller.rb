class PostsController < ApplicationController
  before_action :require_login
  before_action :require_ownership, only[:edit, :update]

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(
    :url, :title, :content, :user_id, sub_ids: [])
  end

  def require_user_owns_post!
    return if current_user.posts.find_by(id: params[:id])
    flash[:errors] = ["You do not own this!"]
    redirect_to posts_url
  end
end
