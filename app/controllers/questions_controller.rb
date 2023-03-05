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
    4.times do
      @question.options.new
    end
  end

  def edit; end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_url(@question), notice: 'Question was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_url(@question), notice: 'Question was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
    else
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
