class AddStreetIdToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :street_id, :integer
  end
end
