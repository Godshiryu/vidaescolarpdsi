class AddColumnSenhaoDiscipline < ActiveRecord::Migration
  def change
  	add_column :disciplines, :senha, :string
  	add_column :disciplines, :codigo, :string
  end
end



