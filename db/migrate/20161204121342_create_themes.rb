class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :nome
      t.references :discipline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
