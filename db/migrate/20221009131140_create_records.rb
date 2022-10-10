class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :detail
      t.integer :time
      t.references :language, null: false, foreign_key: true
      t.timestamps
    end
  end
end
