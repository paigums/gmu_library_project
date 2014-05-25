class SearchesController < ApplicationController
	
	def search(query)
		if query.blank?
			scoped
		else
			q = "%#{query}%"
			where("author like ? or title = ?", q, q)
#		@books = Book.includes(:searches).order(:title).page(params[:page])
		end
	end

end
