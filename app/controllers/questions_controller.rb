class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order created_at: :desc
  end

  def destroy
    if current_user==@question.user
      @question.destroy
      flash[:success] = t('.success')
      redirect_to questions_path
    else
      flash[:warning] = t('.warning')
      redirect_to question_path(@question)
    end
  end

  def edit
  end

  def update
    if current_user==@question.user
      if @question.update question_params
        flash[:success] = t('.success')
        redirect_to questions_path
      else
        render :edit
      end
    else
      flash[:warning] = t('.warning')
      redirect_to question_path(@question)
    end
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = t('.success')
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
