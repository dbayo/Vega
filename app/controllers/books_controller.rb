class BooksController < ApplicationController
	def index
		params[:genre] = "all" if params[:genre].blank?
		@cards = Card.search(params[:search]).getGenre(params[:genre])
	end
end
