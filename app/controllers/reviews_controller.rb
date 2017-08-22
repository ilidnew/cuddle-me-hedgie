class ReviewsController < ApplicationController
  def new
    @hedgie = Hedgie.find(params[:hedgie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.hedgie = Hedgie.find(params[:hedgie_id])
    @review.user = current_user
    @review.save
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def set_review
    @review = Review.find(params[:hedgie_id])
  end

  def review_params
    params.require(:review).permit(:content, :hedgie_id, :user_id)
  end
end
