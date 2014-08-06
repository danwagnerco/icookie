# CSV data for zip code and latitude/longitude
# sourced from http://greatdata.com/free-zip-code-database
class Location < ActiveRecord::Base

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

end
