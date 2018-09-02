class PassengerDashboardsController < ApplicationController
  def show
  	@pickup = Pickup.new
  	@places = Place.all
  	@pickups = Pickup.where(passenger_id: current_user.id)
  end
end
