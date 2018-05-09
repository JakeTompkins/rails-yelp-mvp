class RestaurantsController < ApplicationController
  before_action :set_restaurant, only:[:show]
  def def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    Restaurant.create(restaurant_params)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
