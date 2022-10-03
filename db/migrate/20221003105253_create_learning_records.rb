class CreateLearningRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_records do |t|
      t.string :learning_method
      t.string :language
      t.integer :learning_time
      t.timestamps
    end
  end
end
