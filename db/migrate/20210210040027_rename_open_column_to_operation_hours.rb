class RenameOpenColumnToOperationHours < ActiveRecord::Migration[5.2]
  def change
    rename_column  :operation_hours, :open, :open1
    rename_column  :operation_hours, :close, :close2 
  end
end
