class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    vote = current_user.votes.build(question_id: @question.id)
    unless vote.save
      redirect_to questions_path
    end
    @votes = Vote.where(question_id: params[:question_id])
  end

  def destroy
    vote = Vote.find(params[:id])
    @question = vote.question
    unless vote.destroy
      redirect_to questions_path
    end
    @votes = Vote.where(question_id: params[:question_id])
  end
end
