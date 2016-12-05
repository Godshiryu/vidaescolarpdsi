class Lesson < ActiveRecord::Base
  belongs_to :Discipline
  has_attached_file :anexo
  do_not_validate_attachment_file_type :anexo
end
