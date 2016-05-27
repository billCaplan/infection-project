class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :course_name
      t.integer :teacher, null: false
      t.timestamps null: false
    end
  end
end
