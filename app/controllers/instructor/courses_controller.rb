class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.new
  end

  def create
    #We want to create a course in the database with the currently logged in user
    #And then send the user to the instructor view on the course page
    @course = current_user.courses.create(course_params)
    if @course.valid?
      redirect_to instructor_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
  end
  
  private

  def course_params
    params.require(:course).permit(:title, :description, :cost)
  end

end
