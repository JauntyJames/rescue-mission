class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.all
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    # @question.title = params[:title]
    # @question.description = paramas[:description]
    if @question.save
      flash[:notice] = "Question created!"
      redirect_to questions_path
    elsif
      flash[:alert] = "Question not created"
      render :new
    end
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
