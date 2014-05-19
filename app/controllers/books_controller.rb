class BooksController < ApplicationController
	def index
		params[:genre] = "all" if params[:genre].blank?
		@cards = Card.bookOfKnowledge.language("es").search(params[:search]).getGenre(params[:genre])
	end

	def getSearchResults
		params[:genre] = "all" if params[:genre].blank?
		@cards = Card.bookOfKnowledge.language("es").search(params[:search]).getGenre(params[:genre])

		render :partial => '/js/books/getSearchResults.js.erb'
	end
end
