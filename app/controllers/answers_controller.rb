class AnswersController < ApplicationController

  def create
   @answer = current_user.answers.build(answer_params)
   @question = @answer.question
   respond_to do |format|
     if @answer.save
      format.html{ redirect_to question_path(@question), notice: '回答を投稿しました.' }
      format.js { render :index }
     else
       format.html { render :new }
     end
   end
 end

 def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    if @answer.update(answer_params)
       redirect_to question_path(@question)
    else
       render :edit if @answer.invalid?
    end
  end

 def destroy
   @answer = Answer.find(params[:id])
   @question = @answer.question
   respond_to do |format|
     if @answer.destroy
       format.html{ redirect_to question_path(@question), notice: '回答を削除しました.' }
       format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

 private
   def answer_params
     params.require(:answer).permit(:question_id, :content)
   end
end
