# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :authenticate_admin!

  def index
    @questions = Question.all
  end

  def show; end

  def new
    @question = Question.new
    NO_OF_OPTIONS.times do
      @question.options.new
    end
  end

  def edit; end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash.now[:success] = 'Question was successfully created.'
      redirect_to question_url(@question)
    else
      flash.now[:danger] = @question.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      flash[:success] = 'Question was successfully updated.'
      redirect_to question_url(@question)
    else
      flash.now[:danger] = @question.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.destroy
      flash.now[:success] = 'Question was successfully destroyed.'
      redirect_to questions_url
    else
      flash.now[:danger] = @question.errors.full_messages.to_sentence
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, options_attributes: %i[id _destroy content option_type])
  end
end
