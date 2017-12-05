class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def show
    @review = Review.new
    @reservation = Reservation.find(params[:id])
    @price = @reservation.total_price
  end

  def create
    @reservation = Reservation.create(reservation_params)

    @reservation.status = "accepted"
    @reservation.save

    redirect_to reservation_path(@reservation)
  end

  private

  def reservation_params  
    params.require(:reservation).permit(:guest_id, :check_in, :check_out, :listing_id)
  end
end