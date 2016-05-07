class HomeController < ApplicationController

	def index
		@syllabus = Syllabus.new		
	end

end
