class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :like]
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      flash.clear
      flash[:message] = @post.errors.messages
      render :new
    end
  end

  def new
    @post = Post.new
  end


  def update
    if @post.update(post_params)
      redirect_to @post
    else
      flash.clear
      flash[:message] = @post.errors.messages
      render :edit
    end
  end

  def like
    @post.add_like
    redirect_to post_path(@post)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title,:blogger_id,:destination_id,:content)
    end
end
