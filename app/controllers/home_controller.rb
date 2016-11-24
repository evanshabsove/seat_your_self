class HomeController < ApplicationController
  def index
    # session[:user_id] = nil
    @restaurants = Restaurant.all
  end
end
