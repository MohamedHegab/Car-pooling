class TripsController < ApplicationController
	load_and_authorize_resource
  before_action :set_trip, only: [:update, :destroy]

	def create
		@trip = Trip.new trip_params
		@trip.driver_id = current_user.id
		
		if @trip.save
			redirect_to dashboard_path
		else
			render 'driver_dashboards/show'
		end
	end

	def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "Trip destroyed" }
    end
  end

	private

	def set_trip
    @trip = Trip.find(params[:id])
  end

	def trip_params
		params.require(:trip).permit :source_id, :destination_id, :departure_time, :number_of_seats
	end
end
