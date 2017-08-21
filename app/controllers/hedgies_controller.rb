class HedgiesController < ApplicationController

  def new
    @hedgie = Hedgie.new
  end

  def create
    @hedgie = Hedgie.new(hedgie_params)
    @hedgie.user = current_user
    if @hedgie.save
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  def show
    @hedgie = Hedgie.find(params[:id])
  end

  def search_by_attr
    @hedgies = Hedgie.find(params[:attr])
  end

  private

  def hedgie_params
    params.require(:hedgie).permit(:name, :description, :price, :min_booking)
  end
end
