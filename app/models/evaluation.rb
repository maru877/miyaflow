class Evaluation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :answer, optional: true

  enum rating: { nothing: 0, good: 1, bad: 2 }
end
