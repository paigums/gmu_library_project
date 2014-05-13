class SessionsController < ApplicationController
  def new
  end

  def create
  		user = User.find_by(name:params[:name])
  		if user and user.authenticate(params[:password])
  			session[:user_id] = user.id
  			redirect_to_admin_url
  		end
  		else
  			redirect_to_login_url, alert:"Invalid user/password combination"
  		end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to_store_url, notice: "Logged Out"
  end
end
