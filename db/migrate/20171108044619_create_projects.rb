class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :account, foreign_key: true
      t.string :name
      t.string :secret_word

      t.timestamps
    end
  end
end
