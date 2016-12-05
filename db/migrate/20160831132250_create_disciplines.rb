class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :nome
      t.integer :cargahoraria
      t.references :Course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
