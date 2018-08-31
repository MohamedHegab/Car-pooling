class DriverDashboardsController < ApplicationController
  def show
  	@trip = Trip.new
  	@places = Place.all
  	@trips = Trip.where(driver_id: current_user.id)
  end
end
