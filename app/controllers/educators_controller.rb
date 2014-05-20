class EducatorsController < ApplicationController
	def plan
		@comments = Card.all
		@cards = Card.educators
	end

	def teach

	end
end
