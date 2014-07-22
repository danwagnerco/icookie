require "csv"

namespace :import_locations_csv do
  task :create_locations => :environment do
    CSV.foreach("../lib/assets/free-zip-code-database.csv", :headers => true) do |row|
      Location.create!(row.to_hash)
    end
  end
end
