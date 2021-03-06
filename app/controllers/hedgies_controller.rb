class HedgiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_hedgie, only: [:edit, :update, :destroy]

  def index
    @hedgies = Hedgie.where.not(latitude: nil, longitude: nil)
    @hedgies = @hedgies.near(params[:address], 10) unless params[:address].blank?
    @hash = Gmaps4rails.build_markers(@hedgies) do |hedgie, marker|
      marker.lat hedgie.latitude
      marker.lng hedgie.longitude
      # marker.infowindow render_to_string(partial: "/hedgies/map_box", locals: { hedgie: hedgie })
    end
  end

  def new
    @hedgie = Hedgie.new
  end

  def create
    @hedgie = Hedgie.new(hedgie_params)
    @hedgie.user = current_user
    if @hedgie.save
      redirect_to profile_path(@hedgie.user)
    else
      render :new
    end
  end

  def show
    @hedgie = Hedgie.find(params[:id])
    @hedgies = Hedgie.all
    @booking = Booking.new

  end

  def edit
  end

  def update
    @user = @hedgie.user
    @hedgie.update(hedgie_params)
    if @hedgie.save
      redirect_to hedgy_path(@hedgie), notice:"hedgie created successfully."
    else
      render :new, alert: "Error creating hedgie."
    end
  end

  def destroy
    @hedgie = Hedgie.find(params[:id])
    @hedgie.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, alert: 'hedgie was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_hedgie
    @hedgie = Hedgie.find(params[:id])
  end

  def hedgie_params
    params.require(:hedgie).permit(:name, :description, :price, :min_booking, :hedgy_id, :address, :food, :bed, :poo, :bowl, :toy, :comb, photos: [])
  end
end
