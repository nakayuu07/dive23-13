class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def destroy
  end

  private
    def vote_params
      require(:vote).permit(:plus_or_minus, :user_id, :question_id :answer_id)
end
