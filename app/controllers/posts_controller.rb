class PostsController < ApplicationController
  before_action :post_params, only: [:create, :update]
  before_action :set_post, only: [:show, :update, :destroy, :edit]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end


  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def like

    @post = Post.find(params[:post_id])
    @post.increment! :likes
    redirect_to post_path(@post)
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
  
end
