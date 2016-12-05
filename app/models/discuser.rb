class Discuser < ActiveRecord::Base
      belongs_to :User
      belongs_to :Discipline
end
