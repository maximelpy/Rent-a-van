class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @booking.destroy
    redirect_to bookings_path
  end
end
