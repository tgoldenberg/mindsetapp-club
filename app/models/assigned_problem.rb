class AssignedProblem < ActiveRecord::Base

	belongs_to :teacher
	belongs_to :student
	belongs_to :problem

end
