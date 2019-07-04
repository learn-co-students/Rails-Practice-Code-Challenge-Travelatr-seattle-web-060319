class BloggersController < ApplicationController
  before_action :blogger_params, only: [:create, :update]
  before_action :set_blogger, only: [:show, :update, :destroy, :edit]

  def new
    @blogger = Blogger.new
  end
  
  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash[:error_message] = "Please enter a better answer"
      render :new
    end
  end

  private

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end
