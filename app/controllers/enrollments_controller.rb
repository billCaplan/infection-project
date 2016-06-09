class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)

    student = User.find(params[:enrollment][:student_id])
    course = Course.find(params[:enrollment][:course_id])
    course_teacher = course.teacher

    if(student.id === course.teacher_id )
      flash.now[:errors] = @enrollment.errors.full_messages
      redirect_to root_url
    else
      if @enrollment.save
        if student.version.nil?
          student.update({:version => course_teacher.version})
        else
          @user = User.find(params[:enrollment][:student_id])
          list_to_alter = @user.total_infection

          list_to_alter[2].each do |student_to_alter|
            @user = User.find(student_to_alter.id)
            @user.update({:version => params[:enrollment][:version]})
          end
        end
          redirect_to root_url
      else
        flash.now[:errors] = "This student already teaches the class"
        redirect_to root_url
      end
    end
  end

  def destroy

    @enrollment = Enrollment.where(course_id: params[:course_id], student_id: params[:student_id])

    Enrollment.destroy(@enrollment.first.id)
    redirect_to root_url
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end
end
