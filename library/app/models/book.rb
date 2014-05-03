class Book < ActiveRecord::Base

validates :isbn, :title, :abstract, :pages, :genre, :published_on, :total_in_library, presence: true
validates :pages, 
    numericality: { greater_than_or_equal_to: 1 },
    if: "pages.present?"
validates :total_in_library, 
    numericality: { greater_than_or_equal_to: 1 },
    if: "total_in_library.present?"

#GENRE = 1..5
#validates :abstract, length: { minimum: 15 }, unless: "abstract.blank?"
#validates :genre, inclusion: { in: GENRE, message: "must be from #{GENRE.first} to #{GENRE.last}" }

end
