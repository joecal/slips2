class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_current_user

  helper_method :random_question

  def get_current_user
    if User.exists?(session[:user_id])
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def random_question
   subject1 = Subject.find(1)
  #  get_random_question = subject1.questions.sample
     get_random_question = Question.all.sample
   @question = get_random_question

   answer_user_id_array = @question.answers.collect(&:user_id)

   if answer_user_id_array.include? @current_user.id
    #  get_random_question = subject1.questions.sample
         get_random_question = Question.all.sample
     @question = get_random_question
   else
   end
    @question
  end

end
