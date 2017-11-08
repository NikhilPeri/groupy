class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :participant, foreign_key: true
      t.references :column, foreign_key: true
      t.string :state
      t.text :body

      t.timestamps
    end
  end
end
