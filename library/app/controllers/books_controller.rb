class BooksController < ApplicationController

before_action :set_book, only: [ :show, :edit, :update, :destroy ]

	def index
	  @available_at = Time.now
	  @books = Book.includes(:reservations).order(:title).page(params[:page])
#	  @books = Book.search(params[:search])
#	  respond_to do |format|
#	  	format.html
#	  	format.json { render json: @books }
#	  end
	end

#	def search
#		@books = Book.search(params[:q])
#		render 'index'
#	end

	def show
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
