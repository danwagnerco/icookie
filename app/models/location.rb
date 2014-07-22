# CSV data for zip code and latitude/longitude
# sourced from http://greatdata.com/free-zip-code-database
class Location < ActiveRecord::Base

has_many :users

end
