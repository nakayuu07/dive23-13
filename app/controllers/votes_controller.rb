class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:question_or_answer] == "question"
      @question_or_answer = "question"
      @question = Question.find(params[:question_id])
      vote = current_user.votes.build(question_id: @question.id, plus_or_minus: params[:plus_or_minus])
    elsif params[:question_or_answer] == "answer"
      @question_or_answer = "answer"
      @answer = Answer.find(params[:answer_id])
      @question = @answer.question
      vote = current_user.votes.build(answer_id: @answer.id, plus_or_minus: params[:plus_or_minus])
    end
    unless vote.save
      redirect_to questions_path
    end
  end

  def destroy
    if params[:question_or_answer] == "question"
      @question_or_answer = "question"
      vote = Vote.find(params[:id])
      @question = vote.question
      unless vote.destroy
        redirect_to questions_path
      end
    elsif params[:question_or_answer] == "answer"
      @question_or_answer = "answer"
      vote = Vote.find(params[:id])
      @answer = vote.answer
      @question = @answer.question
      unless vote.destroy
        redirect_to questions_path
      end
    end
  end
end
