class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :category
      t.string :url

      t.timestamps
    end
  end
end
