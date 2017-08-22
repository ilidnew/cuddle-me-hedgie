class HedgiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_hedgie, only: [:edit, :update, :destroy]

  def index
    @hedgies = Hedgie.all
  end

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
    @hedgies = Hedgie.all
  end

  def edit
  end

  def update
    @user = @hedgie.user
    @hedgie.update(hedgie_params)
    if @hedgie.save
      redirect_to hedgie_path(@hedgie), notice:"hedgie created successfully."
    else
      render :new, alert: "Error creating hedgie."
    end
  end

  def destroy
    @hedgie = Hedgie.find(params[:id])
    @hedgie.destroy
    respond_to do |format|
      format.html { redirect_to root_path, alert: 'hedgie was successfully delete.' }
      format.json { head :no_content }
  end

  end

  def search_by_attr
    @hedgies = Hedgie.find(params[:attr])
  end

  private

  def set_hedgie
    @hedgie = Hedgie.find(params[:id])
  end

  def hedgie_params
    params.require(:hedgie).permit(:name, :description, :price, :min_booking)
  end
end
