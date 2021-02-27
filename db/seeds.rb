require "csv"

streets_csv = CSV.readlines("db/streets.csv")
streets_csv.each do |row|
  Street.create(street_name: row[1], side0: row[2], side1: row[3])
end