# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 1
User.create({
  name: "Bill Caplan"
})
# 2
User.create({
  name: "Sam Thompson"
})
# 3
User.create({
  name: "Tony Jones"
})
# 4
User.create({
  name: "Kevin Walter"
})
# 5
User.create({
  name: "Sarah Smith"
})
User.create({
  name: "Sidney Crosby"
})
User.create({
  name: "Amanda Collins"
})
User.create({
  name: "Phil Kessel"
})
User.create({
  name: "Steph Curry"
})
User.create({
  name: "Kristen Smith"
})
User.create({
  name: "Brit Thompson"
})
# 1
Course.create({
  course_name: "Biology",
  teacher_id: 1
})
# 2
Course.create({
  course_name: "Math",
  teacher_id: 2
})
# 3
Course.create({
  course_name: "Art",
  teacher_id: 1
})
# 4
Course.create({
  course_name: "Gym",
  teacher_id: 2
})
# 1
Enrollment.create({
  course_id: 1,
  student_id: 3
})
# 2
Enrollment.create({
  course_id: 1,
  student_id: 4
})
# 3
Enrollment.create({
  course_id: 3,
  student_id: 4
})
#4
Enrollment.create({
  course_id: 3,
  student_id: 5
})
