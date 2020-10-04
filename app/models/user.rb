class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :enrolled_courses
  has_many :courses, through: :enrolled_courses
  has_many :assessment_grades

  validates_presence_of :email
  enum user_type: ['student', 'instructor']
end
