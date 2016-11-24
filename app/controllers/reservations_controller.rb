class ReservationsController < ApplicationController
  before_action :load_restaurant

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      #send email
      # UserMailer.reservation_confirm(current_user).deliver
      redirect_to user_path(current_user), notice: "Reservation made successfully!"
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
   params.require(:reservation).permit(:seats, :date, :time, :restaurant_id)
  end

 def load_restaurant
   @restaurant = Restaurant.find(params[:restaurant_id])
 end

end
