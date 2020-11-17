class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
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

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id)
  end
end
