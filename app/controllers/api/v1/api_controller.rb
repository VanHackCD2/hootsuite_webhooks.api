class Api::V1::ApiController < ApplicationController
	def render_done(title)
		render json: { success: "#{title} done!" }, status: 200
	end

	def render_errors(messages)
    render json: { errors: messages }, status: 422
  end
end
