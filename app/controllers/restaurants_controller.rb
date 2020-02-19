class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
     @restaurant = Restaurant.new
  end

  def create
     @restaurant = Restaurant.new(restaurant_params)
     @restaurant.save
     redirect_to restaurants_path
  end

  def show

    p "je suis la====================================================="


    @reviews = Review.all.where(restaurant_id: params[:id])
    @reviews = @restaurant.reviews

  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_restaurant
   @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
