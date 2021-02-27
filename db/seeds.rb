require "csv"

locations_csv = CSV.readlines("db/locations.csv")
locations_csv.each do |row|
  Location.create(location: row[1], street_id: row[2], side: row[3])
end