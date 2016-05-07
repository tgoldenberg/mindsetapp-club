class CreateProblemTags < ActiveRecord::Migration
  def change
    create_table :problem_tags do |t|
      t.integer :tag_id
      t.integer :problem_id

      t.timestamps null: false
    end
  end
end
