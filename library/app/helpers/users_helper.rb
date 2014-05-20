module UsersHelper
	def show_links
 	 #we may use this inside a user-specific action
    return User.find(session[:user_id]).admin
  end
  def user_is_logged_in?
    !!session[:user_id]
  end
end
