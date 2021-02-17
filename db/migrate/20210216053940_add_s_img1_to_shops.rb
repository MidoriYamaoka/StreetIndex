class AddSImg1ToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :s_img1, :string
    add_column :shops, :s_img2, :string
    add_column :shops, :s_img3, :string
    add_column :shops, :s_img4, :string
    add_column :shops, :s_img5, :string
  end
end
