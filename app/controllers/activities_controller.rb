# frozen_string_literal: true

class ActivitiesController < ApplicationController
  include ActivitiesHelper

  before_action :set_session, only: %i[index]

  def index
    if params[:page].blank?
      empty_cookies_and_session
      max_questions
    end

    @questions = Question.paginate(page: params[:page], per_page: 1)
    map_question_options if cookies[:question_id]
  end

  def create
    map_question_options
    if session[:question_answer_ids].length < session[:max_questions]
      flash[:danger] = 'Every Question should be answered'
    else
      result = calculate_score
      empty_cookies_and_session
      flash[:success] = "You are an #{result}"
      params[:page] = nil
    end

    redirect_to unauthenticated_root_url(page: params[:page])
  end

  private

  def map_question_options
    question_id = cookies[:question_id]
    answer_id = cookies[:answer_id]
    session[:question_answer_ids][question_id] = answer_id
  end

  def set_session
    return if session[:question_answer_ids].present?

    session[:question_answer_ids] = HashWithIndifferentAccess.new
  end

  def empty_cookies_and_session
    session[:question_answer_ids] = nil
    cookies.delete :question_id
    cookies.delete :answer_id
  end

  def max_questions
    session[:max_questions] = Question.count
  end
end
