module Api
  class Data < Grape::API

    resource :students do
      desc 'List students'

      get do
        Student.all
      end

      desc 'Create a new stuent'

      params do
        requires :name, type: String
      end

      post do
        Student.create({
          name: params[:name]
        })
      end

      desc 'delete a student'

      params do
        requires :id, type: String
      end

      delete ':id' do
        student = Student.find_by(id: params[:id])
        status 404 unless student
        student.destroy! if student
      end

      desc 'update a student'

      params do
        requires :id, type: String
        requires :name, type: String
      end

      put ':id' do
        student = Student.find_by(id: params[:id])
        student.update({
          name: params[:name]
        })
      end

      desc 'show a student'

      params do
        requires :id, type: String
      end

      get ':id' do
        student = Student.find_by(id: params[:id])
        return student if student
        status 404
      end
    end
  end
end
