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
  end
end
