class ApiHelper < Grape::API
  helpers do
    def check_correct_user_id(user_id, student)
      user_id == student.user_id
    end
  end
end
