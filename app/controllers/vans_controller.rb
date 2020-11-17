class VansController < ApplicationController


  def show
    @van = Van.find(params[:id])
  end

  def index
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
  end
  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    if @van.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  private

  def van_params
    params.require(:van).permit(:title, :description, :password, :price, :address, :booked)
  end
end
