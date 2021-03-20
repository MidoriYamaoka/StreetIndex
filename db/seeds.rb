require "csv"

operationhours_csv = CSV.readlines("db/operationhours.csv")
    operationhours_csv.each do |row|
        OperationHour.create(shop_id: row[1], day: row[2], open1: row[3], close1: row[4], open2: row[5], close2: row[6])
    end