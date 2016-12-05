class AddColumnToDiscipline < ActiveRecord::Migration
  def change
     add_reference :disciplines, :users, foreign_key: true
  end
end
