class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer created!"
      redirect_to question_path(@question)
    elsif
      flash[:alert] = "Answer not created"
      redirect_to question_path(@question)
    end
  end

  def answer_params
    params.require(:answer).permit(:description)
  end
end
