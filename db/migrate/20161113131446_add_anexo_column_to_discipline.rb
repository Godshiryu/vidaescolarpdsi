class AddAnexoColumnToDiscipline < ActiveRecord::Migration
  def self.up
    change_table :disciplines do |t|
      t.attachment :anexo
    end
  end

  def self.down
    remove_attachment :disciplines, :anexo
  end
end
