class CoursesController < ApplicationController
  def index
    canvas = CanvasApi.new
    @courses = canvas.courses

  rescue CanvasApi::CanvasError => e
    @error = e.message
    @courses = []
  end
end