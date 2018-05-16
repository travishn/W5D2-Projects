class SubsController < ApplicationController
  before_action :require_login

  def create
    @sub = Sub.new(sub_params)
    @sub.id = Sub.user_id

    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])

    unless current_user.id == @sub.user_id
      redirect_to subs_url
      return
    end
  end

  def update
    @sub = Sub.find(params[:id])

    unless current_user.id == @sub.user_id
      redirect_to subs_url
      return
    end

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
