class EducatorsController < ApplicationController
	before_filter :setNavSidebar
	def plan
		@comments = Card.all
		@cards = Card.educators
	end

	def teach

	end

	private
	def setNavSidebar
		@navSidebar = "educators"
	end
end
