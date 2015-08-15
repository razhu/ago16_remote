json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :subject
  json.url teacher_url(teacher, format: :json)
end
