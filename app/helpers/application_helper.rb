# frozen_string_literal: true

module ApplicationHelper
  def attempted_count
    session[:question_answer_ids] ? session[:question_answer_ids].length : 0
  end
end
