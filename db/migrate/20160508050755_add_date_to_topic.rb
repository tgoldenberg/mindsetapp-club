class AddDateToTopic < ActiveRecord::Migration
  def change
  	add_column :topics, :date, :string
  end
end
