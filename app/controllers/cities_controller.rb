class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def filter
    @city = City.find(params[:id])
    @start_date = params[:dates][:start_date]
    @end_date = params[:dates][:end_date]
    @filtered_listings = @city.city_openings(@start_date, @end_date)
    render :filter
  end


end
