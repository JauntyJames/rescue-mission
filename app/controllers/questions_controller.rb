require 'kramdown'

class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    # @question.title = params[:title]
    # @question.description = paramas[:description]
    @question.description = Kramdown::Document.new(@question.description).to_html
    if @question.save
      flash[:notice] = "Question created!"
      redirect_to questions_path
    else
      flash[:alert] = "Question not created"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question updated!"
      redirect_to questions_path
    else
      flash[:alert] = "Question not updated"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    @question.destroy
    @answers.destroy
    flash[:notice] = "Question destroyed"

    redirect_to questions_path
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
