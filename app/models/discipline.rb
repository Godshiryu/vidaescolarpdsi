class Discipline < ActiveRecord::Base
  belongs_to :Course
  has_many :Activity, :dependent => :destroy
  has_many :Discuser, :dependent => :destroy
  has_many :Users, through: :Discuser
  belongs_to :Users
  has_many :discanexo, :dependent => :destroy

  validates_presence_of :nome, :cargahoraria

  def nomecompleto
  	"#{codigo} - #{nome}"
  end

end
