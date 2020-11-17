class VansController < ApplicationController
before_action :set_van, only: [ :show, :edit, :update, :destroy ]

  def index
    @vans = Van.all
  end

  def show
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    if @van.save!
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @van.update(van_params)
      redirect_to van_path(@van)
    else
      render :edit
    end
  end

  def destroy
    @van.destroy
    redirect_to vans_path
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def van_params
    params.require(:van).permit(:title, :description, :price, :address, :booked)
  end
end
