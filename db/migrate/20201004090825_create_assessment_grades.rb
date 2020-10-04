class CreateAssessmentGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :assessment_grades do |t|
      t.integer :user_id
      t.integer :assessment_id
      t.decimal :grade
      t.timestamps
    end
  end
end
