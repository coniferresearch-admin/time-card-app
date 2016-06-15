class Api::V1::PunchesController < ApplicationController
	def create
		clock_out = params[:clock_out]
		render json: {
			message: "hello paul",
			clock_out: clock_out
		}
	end
	def show
		p params[:purplemonkey]
		render json: {
			segment_param: params[:purplemonkey]
		}
	end
end
