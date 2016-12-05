class Grade < ActiveRecord::Base
  belongs_to :User
  belongs_to :Activity, :dependent => :destroy
end

