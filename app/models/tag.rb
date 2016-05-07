class Tag < ActiveRecord::Base

	belongs_to :topic
	has_many :problem_tags
	has_many :problems, through: :problem_tags

end
