
class UsersController < ApplicationController
	def index
	  	@available_at = Time.now
		@users = User.all
	end

  	def show
		@user = User.find(params[:id])
	end

end
