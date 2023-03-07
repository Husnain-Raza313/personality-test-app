module ActivitiesHelper
  
  def calculate_score
    score = 0
    question_answer_ids = session[:question_answer_ids]

    question_answer_ids.each do |_key, value|
      ans = Option.find_by(id: value)
      if ans.introvert?
        score -= 5
      elsif ans.extrovert?
        score += 5
      end
    end

    score.negative? ? 'Introvert' : 'Extrovert'
  end
end
