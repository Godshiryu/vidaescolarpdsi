class CreateProgressQuestions < ActiveRecord::Migration
  def change
    create_table :progress_questions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.string :resposta
      t.integer :status

      t.timestamps null: false
    end
  end
end
