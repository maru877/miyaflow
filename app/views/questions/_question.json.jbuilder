json.extract! question, :id, :title, :content, :is_resolution, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)
