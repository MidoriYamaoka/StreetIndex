class AddLogoUrlToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :logo_url, :string
  end
end
