# CSV data for zip code and latitude/longitude
# sourced from http://greatdata.com/free-zip-code-database
class Location < ActiveRecord::Base
FORECAST_API_KEY   = "f39d345d84508faaa7d05b4ef5cda310" #<~ danwagnerco@gmail.com
ForecastIO.api_key = FORECAST_API_KEY

# TODO move api key, secret token etc. into application yaml file (http://railscasts.com/episodes/85-yaml-configuration-revised)

has_many :users

  def self.lat_lon_pairs
    active_zips = User.uniq.pluck(:zip)
    pairs       = []

    active_zips.each do |zip|
      spot  = self.find_by(:zip => zip)
      pair  = [spot.latitude, spot.longitude]
      pairs << pair
    end

    pairs
  end

  # TODO add method to send forecast calls


end
