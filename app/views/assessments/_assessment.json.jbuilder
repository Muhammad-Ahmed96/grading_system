json.extract! assessment, :id, :name, :weight, :course_id, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)
