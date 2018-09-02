class PickupsController < ApplicationController
	load_and_authorize_resource
  before_action :set_pickup, only: [:update, :destroy]

	def create
		@pickup = Pickup.new pickup_params
		@pickup.passenger_id = current_user.id
		
		if @pickup.save
			redirect_to dashboard_path
		else
			render 'passenger_dashboards/show'
		end
	end

	def destroy
    @pickup.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "Pickup destroyed" }
    end
  end

	private

	def set_pickup
    @pickup = Pickup.find(params[:id])
  end

	def pickup_params
		params.require(:pickup).permit :source_id, :destination_id, :departure_time
	end
end
