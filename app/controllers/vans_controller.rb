class VansController < ApplicationController

<<<<<<< HEAD
  def show
    @van = Van.find(params[:id])
  end

=======
  def index
    @vans = Van.all
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
>>>>>>> 8533a0a1c4437b898e730ab96b32d44d0ffe9c11
end
