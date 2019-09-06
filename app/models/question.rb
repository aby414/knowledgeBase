class Question < ApplicationRecord

  validates :title, presence: true
  validates :answer, presence:  true
end
