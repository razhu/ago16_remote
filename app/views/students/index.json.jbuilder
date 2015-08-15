json.array!(@students) do |student|
  json.extract! student, :id, :name, :final_score
  json.url student_url(student, format: :json)
end
