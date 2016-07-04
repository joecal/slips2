class AnswersController < ApplicationController
  
  # index
  def index
    @answers = Answer.all
  end

  # new
  def new
    redirect_to root_path unless @current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  # create
  def create
    redirect_to root_path unless @current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
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
    params.require(:answer).permit(:body)
  end
end
