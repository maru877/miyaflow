class EvaluationsController < ApplicationController
  before_action :set_answer

  def good
    @answer.evaluations.create(rating: 1, user_id: current_user.id)
    redirect_to question_path(@answer.question)
  end

  def bad
    @answer.evaluations.create(rating: 2, user_id: current_user.id)
    redirect_to question_path(@answer.question)
  end

  def cancel
    Evaluation.find_by(user_id: current_user.id, answer_id: @answer.id).destroy
    redirect_to question_path(@answer.question)
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end
end
