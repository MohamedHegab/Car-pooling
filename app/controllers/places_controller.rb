class PlacesController < ApplicationController
  def new
  	@place = Place.new
  end

  def create
    @place = Place.new place_params

    respond_to do |format|
      if @place.save
        @places = Place.all
        format.html
        format.js
      else
        format.js { render 'new' }
        format.html
      end
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :longitude, :latitude)
  end
end
