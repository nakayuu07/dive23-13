class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    @answers = @user.answers.order("created_at desc")
    @favorites = @user.favorites.order("created_at desc")
    favorite_question_ids = @favorites.map { |f| f.question_id } #お気に入りに登録した質問のidを配列に格納
    @favorite_questions = Question.where(id: [favorite_question_ids])
    answer_question_ids = @answers.map { |a| a.question_id } #回答した質問のidを配列に格納
    @answer_questions = Question.where(id: [answer_question_ids])

    @question_post_count = @questions.count #質問回数
    @answer_post_count = @answers.count #回答回数
    question_ids = @questions.map { |q| q.id } #質問のidを配列に格納
    answer_ids = @answers.map { |a| a.id } #回答のidを配列に格納
    question_contribution_point = Vote.where(question_id: [question_ids]).sum(:plus_or_minus) #質問で得た貢献度
    answer_contribution_point = Vote.where(answer_id: [answer_ids]).sum(:plus_or_minus) #回答で得た貢献度
    @contribution_point = question_contribution_point + answer_contribution_point #貢献度
  end
end
