class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy

  def self.often_use_tag(user)
    count = {}
    user.questions.each do |question|
      question.taggings.each do |tagging|
        if count.has_key?(tagging.tag_id)
          count[tagging.tag_id] += 1
        else
          count[tagging.tag_id] = 1
        end
      end
    end
    Tag.find(count.max_by(&:last)[0]).id
  end
end
