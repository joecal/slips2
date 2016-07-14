class AnswersController < ApplicationController

  # index
  def index
    @answers = Answer.all
  end

  # new
  def new
    # AM: +1
    redirect_to root_path unless @current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  # create
  def create
    # AM: I see you use this multiple times. Could you use something like `before_action` to make your controller more DRY?
    redirect_to root_path unless @current_user
    @question = Question.find(params[:question_id])
    subject_id = @question.subject_id
    @answer = @question.answers.new(answer_params)
    @answer.subject_id = subject_id
    @answer.user = @current_user
    @answer.save

    redirect_to @answer
  end

  #show
  def show
    @answer = Answer.find(params[:id])
  end

  # edit
  def edit
    redirect_to root_path unless @current_user
    @answer = Answer.find(params[:id])
  end


  # update
  def update
    redirect_to root_path unless @current_user
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)

    redirect_to @answer
  end

  # destroy
  def destroy
    redirect_to root_path unless @current_user
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to answers_path
  end

  private
  def answer_params
    # AM: Do you need to pass in a `subject_id` through `answer_params` or is that something you can access via the question an answer belongs to?
    params.require(:answer).permit(:body, :subject_id)
  end
end
