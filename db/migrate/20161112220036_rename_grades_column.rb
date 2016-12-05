class RenameGradesColumn < ActiveRecord::Migration
  def change
     rename_column :grades, :Activities_id, :Activity_id
     rename_column :grades, :Users_id, :User_id
  end
end
