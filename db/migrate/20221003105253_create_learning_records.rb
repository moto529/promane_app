class CreateLearningRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_records do |t|
      t.string :subject
      t.string :language
      t.integer :time
      t.timestamps
    end
  end
end
