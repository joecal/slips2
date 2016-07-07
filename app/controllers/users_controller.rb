class UsersController < ApplicationController

  helper_method :random_question

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_url unless @current_user == @user
  end

  def update
    @user = User.find(params[:id])
    redirect_to root_url unless @current_user == @user
    @user.update(user_params)
    redirect_to users_path(@user)
  end

  def random_question
   subject1 = Subject.find(1)
   get_random_question = subject1.questions.sample
   @question = get_random_question

   answer_user_id_array = @question.answers.collect(&:user_id)

   if answer_user_id_array.include? @current_user.id
     get_random_question = subject1.questions.sample
     @question = get_random_question
   else
   end
    @question
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
