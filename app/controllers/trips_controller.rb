class TripsController < ApplicationController
	def show
		@trip = Trip.find params[:id]
	end

	def new
		@trip = Trip.new
	end

	def create
		@trip = Trip.new trip_params
		@trip.driver_id = current_user.id
		
		if @trip.save
			redirect_to @trip
		else
			render 'driver_dashboards/show'
		end
	end

	def edit

	end

	def update
		@trip = Trip.find params[:id]
		if @trip.save
			redirect_to @trip
		else
			render 'edit'
		end
	end

	private

	def trip_params
		params.require(:trip).permit :source_id, :destination_id, :departure_time, :number_of_seats
	end
end
