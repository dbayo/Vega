class ExploresController < ApplicationController
	before_filter :setNavSidebar
	def index
	end

	private
	def setNavSidebar
		@navSidebar = "explore"
	end
end
