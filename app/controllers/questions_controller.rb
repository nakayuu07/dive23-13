class QuestionsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
       redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
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
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end


    def question_params
       params.require(:question).permit(:title, :content)
    end
end
