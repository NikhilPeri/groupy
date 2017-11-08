class CreateColumns < ActiveRecord::Migration[5.1]
  def change
    create_table :columns do |t|
      t.references :project
      t.string :name

      t.timestamps
    end
  end
end
