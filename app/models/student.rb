class Student < ActiveRecord::Base

	has_many :assigned_problems
	has_many :problems, through: :assigned_problems

end
