class CreateAssignedProblems < ActiveRecord::Migration
  def change
    create_table :assigned_problems do |t|
      t.integer :problem_id
      t.integer :student_id
      t.integer :teacher_id

      t.boolean :is_assigned, default: true
      t.boolean :is_solved, default: false

      t.timestamps null: false
    end
  end
end
