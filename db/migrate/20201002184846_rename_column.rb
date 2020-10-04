class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :enrolled_courses, :student_id, :user_id
  end
end
