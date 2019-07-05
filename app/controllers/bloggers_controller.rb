class BloggersController < ApplicationController
  before_action :set_blogger, only: [:show, :edit, :update, :destroy]

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    redirect_to @blogger
  end

  def index
    @bloggers = Blogger.all
  end

  def show
  end

  def edit
  end

  def update
    @blogger.update(blogger_params)
    redirect_to @blogger
  end

  def destroy
    @blogger.delete
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end

end
