# zip code CSV design:
# row[0] => zip
# row[1] => state
# row[2] => city
# row[3] => county
# row[4] => latitude
# row[5] => longitude

require "csv"

namespace :import_locations_csv do
  task :create_locations => :environment do
    CSV.foreach("../lib/assets/free-zip-code-database.csv", :headers => true) do |row|
        h             = {}
        h[:zip]       = row[0].to_s
        h[:state]     = row[1].to_s
        h[:city]      = row[2].to_s
        h[:county]    = row[3].to_s
        h[:latitude]  = row[4].to_f
        h[:longitude] = row[5].to_f
        Location.create!(h)
    end
  end
end
