require "time"

class AssignmentsController < ApplicationController
  def index
    @course_id = params[:course_id]

    canvas = CanvasApi.new
    @assignments = canvas.assignments(@course_id)
  end
end