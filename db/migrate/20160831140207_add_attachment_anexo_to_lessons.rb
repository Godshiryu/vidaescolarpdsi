class AddAttachmentAnexoToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :anexo
    end
  end

  def self.down
    remove_attachment :lessons, :anexo
  end
end
