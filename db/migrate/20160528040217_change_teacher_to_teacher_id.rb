class ChangeTeacherToTeacherId < ActiveRecord::Migration
  def change
    rename_column :courses, :teacher, :teacher_id
  end
end
