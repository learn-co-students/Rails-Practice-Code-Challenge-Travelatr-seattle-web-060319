class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :click, :update, :destroy]
  before_action :set_lists, only: [:new, :edit]

  def new
    @post = Post.new
    @bloggers = Blogger.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save

      redirect_to @post
    else
      render :action => "new"
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def click
    @post.likes += 1
    @post.save
    render :show
  end

  def edit
    @bloggers = Blogger.all
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
