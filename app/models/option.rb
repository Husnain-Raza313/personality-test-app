class Option < ApplicationRecord
  belongs_to :question, optional: true

  enum option_type: { introvert: 0, extrovert: 1 }

  validates :content, presence: true
  validates :content, uniqueness: { scope: %i[question_id] }
end
