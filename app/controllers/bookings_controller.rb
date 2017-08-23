class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @hedgie = Hedgie.find(params[:hedgy_id])
    @booking = Booking.new
  end

  def create
    @hedgie = Hedgie.find(params[:hedgy_id])
    start_date = Date.strptime(params[:booking][:start_date], '%m/%d/%Y')
    end_date = Date.strptime(params[:booking][:end_date], '%m/%d/%Y')
    @booking = Booking.new(start_date: start_date, end_date: end_date)
    @booking.user = current_user
    @booking.hedgie = @hedgie


    if @booking.save
      redirect_to bookings_path
    else
      Rails.logger.info(@booking.errors.messages)
      render :new
    end
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)

  end
end
