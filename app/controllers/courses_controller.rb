class CoursesController < ApplicationController
  def index
    canvas = CanvasApi.new
    @courses = canvas.courses
  end
end
