class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :nota
      t.references :Activities
      t.references :Users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
