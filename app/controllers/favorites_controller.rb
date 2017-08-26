class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index #お気に入りランキングページ
    #お気に入り数の多いものから上位20件を取得
    @favorites = Favorite.group(:question_id).order('count_all desc').limit(20).count
    @questions = Question.all
  end

  def create #お気に入り追加アクション
    @question = Question.find(params[:question_id])
    favorite = current_user.favorites.build(question_id: @question.id)
    unless favorite.save
      redirect_to questions_path
    end
  end

  def destroy #お気に入り削除アクション
    favorite = Favorite.find(params[:id])
    @question = favorite.question
    unless favorite.destroy
      redirect_to questions_path
    end
  end
end