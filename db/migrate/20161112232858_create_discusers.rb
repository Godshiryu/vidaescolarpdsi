class CreateDiscusers < ActiveRecord::Migration
  def change
    create_table :discusers do |t|
        t.references :User, index: true, foreign_key: true
        t.references :Discipline, index: true, foreign_key: true
        t.timestamps null: false
    end
  end
end
