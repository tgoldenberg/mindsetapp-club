class AddAttachmentToSyllabus < ActiveRecord::Migration
  
  def up
  	add_attachment :syllabuses, :up_load
  end

  def down
  	remove_attachment :syllabuses, :up_load
  end

end