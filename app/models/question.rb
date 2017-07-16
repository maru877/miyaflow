class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags

  validates :title, presence: true
  validates :content, presence: true

  def self.top_3_recommended(tag_id)
    question = []
    recommended_taggings = Tagging.where(tag_id: tag_id).order(updated_at: :desc).limit(3)
    recommended_taggings.each do |tagging|
      question.push(self.find(tagging.question_id))
    end
    question
  end
end
