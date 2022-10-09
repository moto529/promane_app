class RemoveColumnsFromLearningRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :learning_records, :teaching_materials, :string
    remove_column :learning_records, :learning_time, :integer
  end
end
