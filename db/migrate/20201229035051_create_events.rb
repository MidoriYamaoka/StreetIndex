class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_title
      t.date :goal
      t.string :event_url
      t.string :event_area

      t.timestamps
    end
  end
end
