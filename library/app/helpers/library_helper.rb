
module LibraryHelper
  def formatted_time(time)
    time.strftime("%B %d, %Y at %l:%M %p")
  end

  def format_show_reserved_on(book)
	  show = book.show_reserved_on
	  if show
	    pluralize(number_with_precision(show, precision: 1), 'reserved_on')
	  else
	    'No reservations'
	  end
	end

end
