class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    #@questions = @question.tag
    @tags = @tag.questions.includes(:user, :tags)
  end
end
