class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates :content, uniqueness: true, presence: true
  validates_associated :options
end
