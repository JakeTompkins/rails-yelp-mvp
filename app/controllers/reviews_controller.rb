class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    r = Review.new(review_params)
    r.restaurant = @restaurant
    r.save
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
