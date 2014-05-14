class BooksController < ApplicationController
	def index
		@cards = Card.search(params[:search]).getGenre(params[:genre])
	end
end
