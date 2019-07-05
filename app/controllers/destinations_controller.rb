class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    redirect_to @destination
  end

  def index
    @destinations = Destination.all
  end

  def show
  end

  def edit
  end

  def update
    @destination.update(destination_params)
    redirect_to @destination
  end

  def destroy
    @destination.delete
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :country)
  end

  def set_destination
    @destination = Destination.find(params[:id])
  end

end
