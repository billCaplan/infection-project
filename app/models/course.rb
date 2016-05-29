class Course < ActiveRecord::Base

  has_many(
    :enrollments,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: "Enrollment"
  )

  has_many(
  :students,
  through: :enrollments,
  source: :student
  )

  has_one(
    :teacher,
    foreign_key: :id,
    primary_key: :teacher_id,
    class_name: "User"
  )


end
