class BookingsController < ApplicationController
  def index

  end

  def new
    @hedgy = Hedgie.find(params[:hedgy_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to profile_path(@booking.user)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)

  end
end
