class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :tema
      t.datetime :datahora
      t.string :sala
      t.references :Discipline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
