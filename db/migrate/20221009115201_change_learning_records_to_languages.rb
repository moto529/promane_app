class ChangeLearningRecordsToLanguages < ActiveRecord::Migration[7.0]
  def change
    rename_table :learning_records, :languages
  end
end
