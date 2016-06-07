class PunchesController < ApplicationController

	def index
		@user = current_user
		@punches = current_user.punches
	end
end
