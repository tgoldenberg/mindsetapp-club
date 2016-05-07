class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|

    	t.text :body
    	t.text :answer
    	t.boolean :is_proprietary, default: false
    	t.boolean :is_uploaded, default: true    	

      t.timestamps null: false
    end
  end
end
