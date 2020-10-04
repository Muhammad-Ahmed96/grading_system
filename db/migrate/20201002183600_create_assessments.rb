class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments do |t|
      t.string :name
      t.decimal :weight
      t.integer :course_id

      t.timestamps
    end
  end
end
