class SubjectsController < ApplicationController
  # index
  def index
    @subjects = Subject.all
  end

  # new
  def new
    redirect_to root_path unless @current_user
    @subject = Subject.new
  end

  # create
  def create
    redirect_to root_path unless @current_user
    @subject = Subject.new(subject_params)
    @subject.user = @current_user
    @subject.save
    # subject_id = @subject.subject_id
    # @subject.subject_id = subject_id

    redirect_to @subject
  end

  #show
  def show
    @subject = Subject.find(params[:id])
  end

  # edit
  def edit
    redirect_to root_path unless @current_user
    @subject = Subject.find(params[:id])
  end

  # update
  def update
    redirect_to root_path unless @current_user
    @subject = Subject.find(params[:id])
    @subject.update(subject_params)

    redirect_to @subject
  end

  # destroy
  def destroy
    redirect_to root_path unless @current_user
    @subject = Subject.find(params[:id])
    @subject.destroy

    redirect_to subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit(:name)
  end
end
