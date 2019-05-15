class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:new, :create]

  def new
    find_restaurant
    @review = Review.new
  end

  def create
    find_restaurant
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
