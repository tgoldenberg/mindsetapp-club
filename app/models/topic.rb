class Topic < ActiveRecord::Base

	belongs_to :syllabus
	has_many :problem_topics
	has_many :problems, through: :problem_topics
	has_many :tags

end
