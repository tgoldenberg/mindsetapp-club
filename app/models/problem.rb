class Problem < ActiveRecord::Base

	has_many :problem_topics
	has_many :problem_tags
	has_many :tags, through: :problem_tags
	has_many :assigned_problems

end
