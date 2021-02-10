class AddOpen2ToOperationHours < ActiveRecord::Migration[5.2]
  def change
    add_column :operation_hours, :open2, :integer
    add_column :operation_hours, :close1, :integer
  end
end
