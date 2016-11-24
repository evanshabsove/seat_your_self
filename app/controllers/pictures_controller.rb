class PicturesController < ApplicationController
  before_action :load_restaurant

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = @restaurant.pictures.build(picture_params)
    @picture.user = current_user

    if @picture.save
      redirect_to restaurants_url, notice: "Picture posted successfully!"
    else
      render 'restaurants/show'
    end
  end

  def destroy
    @picture = picture.find(params[:id])
    @picture.destroy
  end

  private
 def picture_params
   params.require(:picture).permit(:url, :description, :restaurant_id)
 end

 def load_restaurant
   @restaurant = Restaurant.find(params[:restaurant_id])
 end

end
