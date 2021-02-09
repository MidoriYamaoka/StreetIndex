class AddOpenHoursToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :open_hours, :text
  end
end
