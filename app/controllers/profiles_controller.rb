class ProfilesController < ApplicationController
skip_after_action :verify_authorized

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :age, :driving_licence_year, :photo)
  end
end
