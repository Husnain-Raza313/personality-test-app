# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_session, only: %i[index]
  def index
    @questions = Question.paginate(page: params[:page], per_page: 1)
    map_question_options if cookies[:question_id]
  end

  def create
    map_question_options
    if session[:question_answer_ids].length < 4
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
    return unless session[:question_answer_ids].blank?

    session[:question_answer_ids] = HashWithIndifferentAccess.new
  end

  def calculate_score
    score = 0
    question_answer_ids = session[:question_answer_ids]

    question_answer_ids.each do |key, value|
      ans = Option.find_by(id: value)
      if ans.introvert?
        score = score - 5
      elsif ans.extrovert?
        score = score + 5
      end

    end

    return score < 0 ? "Introvert": "Extrovert"
  end

  def empty_cookies_and_session
    session[:question_answer_ids] = nil
    cookies.delete :question_id
    cookies.delete :answer_id
  end

end
