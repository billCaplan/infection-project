
class User < ActiveRecord::Base
  has_many(
    :student_enrollments,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: "Enrollment"
  )
  has_many(
    :classes_attended,
    through: :student_enrollments,
    source: :course
  )

  has_many(
    :classes_taught,
    foreign_key: :teacher_id,
    primary_key: :id,
    class_name: "Course"
  )


  def total_infection

    target_student = self

    total_infected_amount = 0

    infected_student_list = []
    infected_student_queue = []

    seen_students = Hash.new("no")
    seen_classes = Hash.new("no")

    affected_classes_list = []
    #  FN 1 Now I take the student, find their classes, taught and student, and grab those associated students

    while true
      seen_students[target_student] = "yes"
      class_student_retrieve_queue = []


      # add the infected student to the list
      infected_student_list.push(target_student)
      # increment the counter
      total_infected_amount += 1
      # get the list of associated_classes
      new_associated_classes = associated_classes(target_student)
      # now check if ive checked them before

      new_associated_classes.each do |new_associated|
        if (seen_classes[new_associated] === "no")
          # push the class to the overall array
          affected_classes_list.push(new_associated)
          # push the class to the queue
          class_student_retrieve_queue.push(new_associated)
          seen_classes[new_associated] = "yes"
        end
      end

      # now I have a queue of classes that have not been seen_classes
      # Time to check the class for students and teachers

      class_student_retrieve_queue.each do |class_queue_item|
        if (seen_students[class_queue_item.teacher] === "no")
          # if the teacher has not been seen_students
          seen_students[class_queue_item.teacher] = "yes"
          infected_student_queue.push(class_queue_item.teacher)
        end
        class_queue_item.students.each do |class_queue_item_student|
          if (seen_students[class_queue_item_student] === "no")
            # if the teacher has not been seen_students
            seen_students[class_queue_item_student] = "yes"
            infected_student_queue.push(class_queue_item_student)
          end
        end
      end
        # now the new classes have been analyzed and the students added to the queue
      if infected_student_queue.length === 0
        break
      else
        target_student = infected_student_queue.shift
      end
    end
    return [total_infected_amount,affected_classes_list, infected_student_list]
  end



  private

  def associated_classes(origin_student)
    classes_affected = []

    origin_student.classes_taught.each do |class_item|
      classes_affected.push(class_item)
    end

    origin_student.classes_attended.each do |class_item|
      classes_affected.push(class_item)
    end

    return classes_affected
  end



end
