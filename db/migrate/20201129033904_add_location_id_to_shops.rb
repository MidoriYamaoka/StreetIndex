class AddLocationIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :location_id, :integer
  end
end
