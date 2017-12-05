class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.create(review_params)
    @listing = @review.reservation.listing
    redirect_to listing_path(@listing)
  end




  private

  def review_params
    params.require(:review).permit(:guest_id, :reservation_id, :description, :rating)
  end

end