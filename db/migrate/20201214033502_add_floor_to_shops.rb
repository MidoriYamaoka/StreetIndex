class AddFloorToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :floor, :integer
  end
end
