class Assessment < ApplicationRecord
  belongs_to :course
  has_many :assessment_grades
end
