class RemoveOpenHoursFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :open_hours, :text
  end
end
