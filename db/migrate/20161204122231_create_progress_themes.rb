class CreateProgressThemes < ActiveRecord::Migration
  def change
    create_table :progress_themes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :theme, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
