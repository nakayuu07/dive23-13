class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.create(user_id: current_user.id, question_id: params[:question_id])
    @votes = Vote.where(question_id: params[:tweet_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, question_id: params[:quesiton_id])
    like.destroy
    @votes = Vote.where(tweet_id: params[:tweet_id])
  end
end
