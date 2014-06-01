class ReservationsController < ApplicationController
	before_action :set_book, except: [ :destroy, :index, :overdue ]

	def index
	  @reservations = current_user.reservations.order('created_at desc')
	end
    
    def show
	end
	
	def new
	  @reservation = @book.reservations.new
	  logger.debug "Reservation's book: " + @reservation.book.title
	end

	def create
      now = Time.new
	  @reservation = @book.reservations.new({:reserved_on => now, :due_on => now + 5.days, :user => current_user})
	    if @reservation.save(current_user)
	      redirect_to book_reservations_path(@book), notice: @book.title + ' has been Reserved!'
	    else
	      render :new
	    end
	 end

	def overdue
	  @reservations = current_user.reservations.order('created_at desc')
	  #@reservations = current_user.reservations
	  
	  #Question:  Why isn't this redirect working
	  #redirect_to overdue_reservations_path, notice:  'Books are overdue!'
	end
      #@reservation = @book.reservations.new(reservation_params)
      #due = Time.past?
  	  #@overdue = @book.reservations.due({:due_on => due, :user => current_user})
	  #if Time.past?
      #  redirect_to @book,  notice: @book.title + ' is overdue!'
	  #else
	  # render :new
	  #end
	  
	#end
      #else 
      #	redirect_to book_reservations_path(@book), notice: @book.title + ' is not Available!'
      #	@books.total_in_library -= 1
      #end
    
    # Added on 26-May
    def destroy
      logger.debug "This will destroy reservation #{params[:id]}"

	  reservation = Reservation.find(params[:id])
      reservation.destroy
      redirect_to reservations_path, notice: "#{reservation.book.title} has been returned"
      #Questions:  Why isn't @ symbol needed in this case?
      #@reservation.destroy
      #redirect_to reservations_url
    end

	private

	def set_book
		@book = Book.find(params[:book_id])
	end

    #No longer needed per Scott (Instructor) because it's not being called in this controller
	#def reservation_params
	#  params.require(:reservation).permit(:reserved_on, :due_on)
	#end
	
end