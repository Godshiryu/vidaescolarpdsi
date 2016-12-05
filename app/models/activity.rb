class Activity < ActiveRecord::Base
    belongs_to :Discipline
    has_many :Grade, :dependent => :destroy

     def start_time
        self.data ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
    
end
