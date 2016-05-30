class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to root_url
    else
      flash.now[:errors] = @course.errors.full_messages
      redirect_to root_url
    end
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :teacher_id)
  end
end
