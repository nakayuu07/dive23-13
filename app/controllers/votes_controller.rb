class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:question_or_answer] == "question"
      @question_or_answer = "question"
      @question = Question.find(params[:question_id])
      if params[:plus_or_minus] == "plus"
        @plus_or_minus = "plus"
        vote = current_user.votes.build(question_id: @question.id, plus_or_minus: 1)
      elsif params[:plus_or_minus] == "minus"
        @plus_or_minus = "minus"
        vote = current_user.votes.build(question_id: @question.id, plus_or_minus: -1)
      elsif params[:plus_or_minus] == "minustoplus"
        @plus_or_minus = "minustoplus"
        vote = Vote.find_by(user_id: current_user, question_id: @question.id)
        vote.destroy
        vote = current_user.votes.build(question_id: @question.id, plus_or_minus: 1)
      elsif params[:plus_or_minus] == "plustominus"
        @plus_or_minus = "plustominus"
        vote = Vote.find_by(user_id: current_user, question_id: @question.id)
        vote.destroy
        vote = current_user.votes.build(question_id: @question.id, plus_or_minus: -1)
      end
      unless vote.save
        redirect_to questions_path
      end
    elsif params[:question_or_answer] == "answer"
      @question_or_answer = "answer"
      @answer = Answer.find(params[:answer_id])
      @question = @answer.question
      if params[:plus_or_minus] == "plus"
        @plus_or_minus = "plus"
        vote = current_user.votes.build(question_id: @question.id, answer_id: @answer.id, plus_or_minus: 1)
      elsif params[:plus_or_minus] == "minus"
        @plus_or_minus = "minus"
        vote = current_user.votes.build(question_id: @question.id, answer_id: @answer.id, plus_or_minus: -1)
      end
      unless vote.save
        redirect_to questions_path
      end
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
