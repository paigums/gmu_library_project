
class UserController < ApplicationController
  def index
  	@available_at = Time.now
	@user = User.all
  end
end
