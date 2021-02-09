class CreateStreets < ActiveRecord::Migration[5.2]
  def change
    create_table :streets do |t|
      t.string :street_name
      t.integer :side

      t.timestamps
    end
  end
end
