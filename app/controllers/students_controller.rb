class StudentsController < ApplicationController
  before_action :get_student, only: %i[show update destroy]

  def create
    @student = Student.new(name: params[:name])
    if @student.save
      head 201
    else
      head 204
    end
  end

  def index
    @students = Student.all
    render json: @students,  adapter: :json, root: 'students'
  end

  def show
    render json: @student,  adapter: :json, root: 'student'
  end

  def destroy
    @student.destroy
    head 204
  end

  private

  def get_student
    @student = Student.find_by(id: params[:id])
    head(404) && return unless @student
  end
end
