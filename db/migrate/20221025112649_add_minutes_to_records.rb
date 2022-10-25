class AddMinutesToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :laerning_minutes, :integer
  end
end
