class Instructor::LessonsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @lesson = Lesson.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.create(lesson_params)
    #make sure to review the above line and make sure it makes sense...
    redirect_to instructor_course_path(@section.course)
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
