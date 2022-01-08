
class AnswersController < ApplicationController
    before_action :set_question!
    before_action :set_answer!, only: %i[ destroy edit update]

    def update
      if current_user==@answer.user
        if @answer.update answer_update_params
          flash[:success] = t '.success'
          redirect_to question_path(@question)
        else
          render :edit
        end
      else
        flash[:warning] = t '.warning'
        redirect_to question_path(@question)
      end
    end
    def edit
        
    end
    def create
      @answer = @question.answers.build answer_create_params
  
      if @answer.save
        flash[:success] = t '.success'
        redirect_to question_path(@question)
      else
        @answers = @question.answers.order created_at: :desc
        render 'questions/show'
      end
    end
  
    def destroy
      if current_user==@answer.user
        @answer.destroy
        flash[:success] = t '.success'
        redirect_to question_path(@question)
      else
        flash[:warning] = t '.warning'
        redirect_to question_path(@question)
      end
    end
  
    private
  
    def answer_create_params
      params.require(:answer).permit(:body).merge(user: current_user)
    end

    def answer_update_params
      params.require(:answer).permit(:body)
    end
  
    def set_question!
      @question = Question.find params[:question_id]
    end

    def set_answer!
        @answer = @question.answers.find params[:id]
    end
  end