class ReviewsController < ApplicationController
  before_filter :set_review, only: [:show, :edit, :update, :destroy, :index]

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    @review.user = current_user
    @review.save
    if @review.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to bookings_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :hedgie_id, :user_id)
  end
end
