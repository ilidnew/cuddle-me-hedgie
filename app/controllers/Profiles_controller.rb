class ProfilesController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = current_user
    @hedgies = Hedgie.where(user_id: current_user.id)
    # .where(user: current_user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    @user.save
    if @user.save
      redirect_to profile_path(@user), alert:"user created successfully."
    else
      render :new, alert: "Error creating user."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  def set_user
    @user = current_user
  end
end


