class PlacesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @places = Place.all
  end

  def show
  end

  def new
  	@place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new place_params
    @places = Place.all

    respond_to do |format|
      if @place.save
        format.html {redirect_to places_path}
        format.js
      else
        format.js { render :new }
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to places_path, notice: (t '.notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: "place destroyed" }
    end
  end

  def get_places
    @draw = params[:draw]
    limit = params[:length].to_i > 0 ? params[:length].to_i : nil
    @places = Place.all.limit(limit).offset(params[:start].to_i)
  end

  private

  def place_params
    params.require(:place).permit(:name, :longitude, :latitude)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
