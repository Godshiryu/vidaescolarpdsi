class CreateJoinTableAnexoDiscipline < ActiveRecord::Migration
	def change
		create_table :discanexos do |t|
			t.references :Discipline, index: true, foreign_key: true
			t.attachment :anexo
			t.timestamps null: false
		end
	
	remove_attachment :disciplines, :anexo		
	end

end
