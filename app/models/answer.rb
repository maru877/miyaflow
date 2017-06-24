class Answer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :belongs_to, optional: true
end
