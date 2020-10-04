json.extract! course, :id, :code, :name, :semester_id, :catalog_data, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
