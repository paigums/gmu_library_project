
class UserController < ApplicationController
	def index
	  	@available_at = Time.now
		@user = User.all
	end

  	def show
		@user = User.find(params[:id])
	end

end
