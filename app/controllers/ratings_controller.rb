class RatingsController < ApplicationController
  before_action :set_van, only: [ :show, :edit, :update, :destroy ]

  def index
    @ratings = policy_scope(Rating).order(:created_at)
  end

  def show
    authorize(@rating)
  end

  def new
    @van = Van.find(params[:van_id])
    @rating = Rating.new
    authorize(@rating)
  end

  def create
    @van = Van.find(params[:van_id])
    @rating = Rating.new(rating_params)
    @rating.van = @van
    authorize(@rating)
    if @rating.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    authorize(@rating)
  end

  def update
    if @rating.update(rating_params)
      redirect_to rating_path(@rating)
      authorize(@rating)
    else
      render :edit
    end
  end

  def destroy
    authorize(@rating)
    @rating.destroy
    redirect_to ratings_path
  end

  private

  def set_van
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:stars, :comment)
  end
end
