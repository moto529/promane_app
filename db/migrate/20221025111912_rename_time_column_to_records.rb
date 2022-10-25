class RenameTimeColumnToRecords < ActiveRecord::Migration[7.0]
  def change
    rename_column :records, :time, :learning_hours
  end
end
