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

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @user = current_user
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to profile_path(@user), notice:"status changed successfully."
    else
      redirect_to root_path alert: "Error changing status."
    end
  end


# def update
#     @user.update(user_params)
#     @user.save
#     if @user.save
#       redirect_to profile_path(@user), alert:"user created successfully."
#     else
#       render :new, alert: "Error creating user."
#     end
  # end


  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :hedgie_id, :status)
  end
end

 # t.date     "start_date"
 #    t.date     "end_date"
 #    t.string   "status",     default: "pending"
 #    t.integer  "user_id"
 #    t.integer  "hedgie_id"







