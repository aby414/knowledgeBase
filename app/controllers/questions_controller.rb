class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question =Question.find_by(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if(@question.update(question_params))
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def create
    @question = Question.new(question_params)

    if(@question.save)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def question_params
    params.require(:question).permit(:title, :answer)
  end
end