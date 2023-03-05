class Question < ApplicationRecord
  validates :content, uniqueness: true, presence: true
end
