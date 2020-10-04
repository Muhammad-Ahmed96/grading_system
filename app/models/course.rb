class Course < ApplicationRecord
  has_many :assessments
  accepts_nested_attributes_for :assessments,reject_if: :all_blank, allow_destroy: true
  has_many :enrolled_courses
  has_many :users, through: :enrolled_courses
end
