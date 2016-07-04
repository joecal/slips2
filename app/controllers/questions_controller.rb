class QuestionsController < ApplicationController
  # index
  def index
    @questions = Question.all
  end

  # new
  def new
    redirect_to root_path unless @current_user
    if @subject == nil
      @question = Question.new
    end
    else
      @subject = Subject.find(params[:subject_id])
      @question = @subject.questions.new
    end


  # create
  def create
    redirect_to root_path unless @current_user
    @subject = Subject.find(params[:subject_id])
    @question = @subject.questions.new(question_params)
    @question.user = @current_user
    @question.save

    redirect_to @question
  end

  #show
  def show
    @question = Question.find(params[:id])
  end

  # edit
  def edit
    redirect_to root_path unless @current_user
    @question = Question.find(params[:id])
  end

  # update
  def update
    redirect_to root_path unless @current_user
    @question = Question.find(params[:id])
    @question.update(question_params)

    redirect_to @question
  end

  # destroy
  def destroy
    redirect_to root_path unless @current_user
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:question_text)
  end
end
