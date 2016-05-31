class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)

    student = User.find(params[:enrollment][:student_id])
    course = Course.find(params[:enrollment][:course_id])
    course_teacher = course.teacher

    if @enrollment.save
      if student.version.nil?
        student.update({:version => course_teacher.version})
      end
        redirect_to root_url
    else
      flash.now[:errors] = @enrollment.errors.full_messages
      redirect_to root_url
    end
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end
end
