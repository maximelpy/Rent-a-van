class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @van = Van.find(params[:van_id])
    @booking = Booking.new
  end

  def create
    @van = Van.find(params[:van_id])
    @booking = Booking.new(booking_params)
    @booking.van = @van
    @booking.user = current_user
    if @booking.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def update
    @booking.approved = true
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :approved)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
