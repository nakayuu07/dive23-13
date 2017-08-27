class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @questions = Question.where(user_id: params[:id]).order("created_at desc")
    @answers = Answer.where(user_id: params[:id]).order("created_at desc")
    @favorites = Favorite.where(user_id: params[:id]).order("created_at desc")
    @questions_all = Question.all
  end
end
