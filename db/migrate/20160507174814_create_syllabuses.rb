class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|

    	t.string :course_name
    	t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
