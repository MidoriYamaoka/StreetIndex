class AddSide1ToStreets < ActiveRecord::Migration[5.2]
  def change
    add_column :streets, :side1, :integer
  end
end
