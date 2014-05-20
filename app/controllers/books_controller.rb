class BooksController < ApplicationController
	before_filter :setNavSidebar
	def index
		params[:genre] = "all" if params[:genre].blank?
		@cards = Card.bookOfKnowledge.language(I18n.locale).search(params[:search]).getGenre(params[:genre])
	end

	def getSearchResults
		params[:genre] = "all" if params[:genre].blank?
		@cards = Card.bookOfKnowledge.language(I18n.locale).search(params[:search]).getGenre(params[:genre])

		render :partial => '/js/books/getSearchResults.js.erb'
	end

	private
	def setNavSidebar
		@navSidebar = "book"
	end
end
