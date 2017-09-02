class QuestionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index
    @questions = Question.all.includes(:user, :tags)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    input_tags_names.each do |name|

      tag = Tag.register!(name)
      @question.taggings.build(tag_id: tag.id)
    end
    if @question.save
       redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @question.tags.destroy_all
    input_tags_names.each do |name|
      tag = Tag.register!(name)
      @question.taggings.build(tag_id: tag.id)
    end
    if @question.update(question_params)
       redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def show
   @answer = @question.answers.build
   @answers = @question.answers.includes(:user)
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end
    def question_params
       params.require(:question).permit(:title, :content)
    end
    def input_tags_names
      params.require(:question).permit(:tags)['tags'].split(",")
    end
end
