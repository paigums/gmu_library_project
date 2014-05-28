class SearchesController < ApplicationController

	def search
		@available_at = Time.now
		@query = params[:query]
		@page_title = "Search Results for \"#{@query}\""

		q = "%#{@query}%"
		@books = Book.where("author like ? or title like ?", q, q)
					 .order(:title)
					 .page(params[:page])
#		logger.debug "Found #{@books.size} books"
		render 'books/index'
	end

end
