class CreateProblemTopics < ActiveRecord::Migration
  def change
    create_table :problem_topics do |t|
      
      t.integer :topic_id
      t.integer :problem_id

      t.timestamps null: false
    end
  end
end
