class RenameLearningMethodColumnToLearningRecords < ActiveRecord::Migration[7.0]
  def change
    rename_column :learning_records, :learning_method, :teaching_materials
  end
end
