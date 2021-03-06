class Answer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :question, optional: true
  has_many :evaluations, dependent: :destroy

  validates :body, presence: true
end
