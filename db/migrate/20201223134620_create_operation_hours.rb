class CreateOperationHours < ActiveRecord::Migration[5.2]
  def change
    create_table :operation_hours do |t|
      t.integer :shop_id
      t.text :day
      t.integer :open
      t.integer :close
      t.text :note

      t.timestamps
    end
  end
end
