class UsersController < ApplicationController
  def show
    @user = User.find(params[:format])
    @questions = @user.questions.order(updated_at: :desc).page(params[:page]).per(10)
    @answers = @user.answers.order(updated_at: :desc).page(params[:page]).per(10)
  end
end
