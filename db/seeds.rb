require "csv"
    shops_csv = CSV.readlines("db/shops.csv")
    shops_csv.each do |row|
    Shop.create(location_id: row[1], shop_name: row[2], category: row[3], url: row[4], logo_url: row[5], floor: row[6])
end