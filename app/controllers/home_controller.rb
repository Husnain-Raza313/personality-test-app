# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page], per_page: 1)
  end
end
