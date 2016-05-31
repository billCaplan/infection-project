class Enrollment < ActiveRecord::Base

  validates :student_id, uniqueness: { scope: [:course_id] }
  

  has_one(
  :course,
  foreign_key: :id,
  primary_key: :course_id,
  class_name: "Course"
  )

  has_one(
  :student,
  foreign_key: :id,
  primary_key: :student_id,
  class_name: "User"
  )
end
