module QuestionsHelper
  def resolution_text(question)
    if question.is_resolution?
      '未解決に戻す'
    else
      '解決にする'
    end
  end
end
