class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :theme, index: true, foreign_key: true
      t.text :pergunta
      t.string :resposta
      t.text :alternativaA
      t.text :alternativaB
      t.text :alternativaC
      t.text :alternativaD
      t.text :alternativaE

      t.timestamps null: false
    end
  end
end
