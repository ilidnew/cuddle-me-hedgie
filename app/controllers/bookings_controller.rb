class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to profile_path(@user)
    else
      render :new

    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)

  end
end
