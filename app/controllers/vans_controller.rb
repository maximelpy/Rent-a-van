class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_van, only: [ :show, :edit, :update, :destroy ]

  def index
    @vans = policy_scope(Van).order(:created_at)
  end

  def show
    authorize(@van)
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    authorize(@van)
    if @van.save!
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def edit
    authorize(@van)
  end

  def update
    authorize(@van)
    if @van.update(van_params)
      redirect_to van_path(@van)
    else
      render :edit
    end
  end

  def destroy
    authorize(@van)
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
