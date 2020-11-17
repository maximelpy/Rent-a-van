class VansController < ApplicationController

  def show
    @van = Van.find(params[:id])
  end
end
