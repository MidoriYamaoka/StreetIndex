require "csv"

events_csv = CSV.readlines("db/events.csv")
events_csv.each do |row|
  Event.create(event_title: row[1], goal: row[2], event_url: row[3])
end