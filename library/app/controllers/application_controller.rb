class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout ->(controller) { controller.request.xhr? ? false : 'application' }

  #before_action :authorize

  helper_method :current_user
  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def current_user
      User.find_by(id: session[:user_id])
    end
    
end
