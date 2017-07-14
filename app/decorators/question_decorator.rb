module QuestionDecorator
  def three_days_later
    self.updated_at.since(3.days)
  end
end
