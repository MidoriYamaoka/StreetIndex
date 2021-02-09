class RenameSideColumnToStreets < ActiveRecord::Migration[5.2]
  def change
    rename_column :streets, :side, :side0
  end
end
