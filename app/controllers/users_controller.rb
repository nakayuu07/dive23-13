class UsersController < ApplicationController
  before_action :authenticate_user!

  def favorite
    if user_signed_in?
      @my_favorites = Favorite.where(user_id: current_user.id)
      @questions = Question.all
    else
      render 'new_user_session_path'
    end
  end
end
