class Book < ActiveRecord::Base
has_many :reservations, dependent: :destroy
validates :isbn, :title, :abstract, :pages, :genre, :published_on, :total_in_library, presence: true
validates :pages, 
    numericality: { greater_than_or_equal_to: 1 },
    if: "pages.present?"
validates :total_in_library, 
    numericality: { greater_than_or_equal_to: 1 },
    if: "total_in_library.present?"
validates :abstract, length: { minimum: 15 }, unless: "abstract.blank?"
validates :genre, inclusion: { in: %w(Football Basketball Baseball Hockey General),
	message: "%{value} is not a valid genre" }
# google date regex (regular expressions) to do a date validation so the correct format is used when adding a book to the database
searchable do 
	text :title, :author
end
#	def show_reserved_on
#	  reservations.show(:reserved_on)
#	end

	def show_reserved_on
	  if reservations.loaded?
	    reservations.map(&:reserved_on).compact
	  else
	    reservations.show(:reserved_on)
	  end
	end

	def search
		search = Book.search params[:term]
		@books = search.results
		render'index'# or your view
	end

#BOOKS = 1..5
#validates :abstract, length: { minimum: 15 }, unless: "abstract.blank?"
#validates :genre, inclusion: { in: BOOKS, message: "must be from #{BOOKS.first} to #{BOOKS.last}" }

end
