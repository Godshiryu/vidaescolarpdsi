class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :nome
      t.references :Discipline
      t.datetime :data
      t.timestamps null: false
    end
  end
end
