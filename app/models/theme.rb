class Theme < ActiveRecord::Base
	belongs_to :discipline
	has_one :progress_theme
	has_many :question

end
