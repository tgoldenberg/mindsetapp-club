class Teacher < ActiveRecord::Base

	has_many :syllabuses
	has_many :problems, through: :assigned_problems

end
