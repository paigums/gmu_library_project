class BooksController < ApplicationController

before_action :set_book, only: [ :show, :edit, :update, :destroy ]

	def index
	  @page_title = 'All Books'
	  @available_at = Time.now
	  @books = Book.includes(:reservations).order(:title).page(params[:page])
	end

	def show
		logger.debug "controller show method"
	end

	def new
	  @book = Book.new
	end

	def edit
	end

	def create
	    @book = Book.new(book_params)
	    if @book.save
	      redirect_to @book, notice: '#{@book.title} was created!'
	    else
	      render :new
	    end
	end


	def update
	    if @book.update(book_params)
	      redirect_to @book, notice: "#{@book.title} was created!"
	    else
	      render :new
	    end
	end

	def destroy
	  @book.destroy
	  redirect_to books_url
	end

	private

	def set_book
	  @book = Book.find(params[:id])
	end

	def book_params
	  params.require(:book).permit(:title, :author, :pages, :price, :isbn, :author_id, :genre, :abstract, :image_cover_url, :published_on, :total_in_library)
	end

end
