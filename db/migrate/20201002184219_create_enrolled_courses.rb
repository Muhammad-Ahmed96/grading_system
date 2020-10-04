class CreateEnrolledCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :enrolled_courses do |t|
      t.integer :student_id
      t.integer :course_id
      t.decimal :grade

      t.timestamps
    end
  end
end
