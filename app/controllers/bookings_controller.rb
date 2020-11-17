class BookingsController < ApplicationController

  def index
    @vans = Van.all
  end
end
