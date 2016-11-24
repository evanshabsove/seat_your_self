class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    if params[:price]
    @found_restaurants = Restaurant.search(params[:search], params[:location], params[:cuisine], params[:price])
    else
    @found_restaurants = Restaurant.search_sans_price(params[:search], params[:location], params[:cuisine])
    end
  end

  def show
    @restaurant  = Restaurant.find(params[:id])
    if current_user
      @review = @restaurant.reviews.build
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_url
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_url(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant  = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_url
  end


private
def restaurant_params
  params.require(:restaurant).permit(:name, :max_seats, :location, :cuisine, :open_time, :close_time, :price)
end
end
