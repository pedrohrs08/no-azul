class StatementController < ApplicationController
	def finances
		@finances = FinanceRecord.from_date(Date.parse(params[:from]))
					.to_date(Date.parse(params[:to])) unless params[:from].nil? || params[:to].nil? 
		render json: @finances
	end 
end
