class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
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
