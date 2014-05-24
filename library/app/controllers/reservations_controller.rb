class ReservationsController < ApplicationController
	before_action :set_book

	def index
	  @reservations = @book.reservations.order('created_at desc')
	end

	def new
	  @reservation = @book.reservations.new
	  logger.debug "Reservation's book: " + @reservation.book.title
	end

	def create
	  #@reservation = @book.reservations.new(reservation_params)
	  now = Time.new
	  #user = User.find_by(id: session[:user_id])
	  @reservation = @book.reservations.new({:reserved_on => now, :due_on => now+7.days, :user => current_user})
	  if @reservation.save
	    redirect_to book_reservations_path(@book), notice: 'Reserved!'
	  else
	    render :new
	  end
	end


	private

	def set_book
	  @book = Book.find(params[:book_id])
	end

	#def reservation_params
	#  params.require(:reservation).permit(:reserved_on, :due_on)
	#end

end
