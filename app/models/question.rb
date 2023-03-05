class Question < ApplicationRecord
  has_many :options

  validates :content, uniqueness: true, presence: true
end
