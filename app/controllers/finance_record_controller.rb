class FinanceRecordController < ApplicationController
    before_action :set_finance, only: [:finance, :update]
    def index
    
    end
	
	def finances
		@finances = FinanceRecord.from_date(Date.parse(params[:from]))
					.to_date(Date.parse(params[:to])) unless params[:from].nil? || params[:to].nil? 
	#	render json: @finances
	end

	def finance
		#render json: @finance
	end 

	def create
      @finance_record = FinanceRecord.new(finance_params)
        
      if @finance_record.save
       	 render json: @finance_record, status: :created
      else
       	 render json: @finance_record.errors, status: :unprocessable_entity
      end 
	end

	def update
       if @finance.update(finance_params)
          head :no_content
       else
       	  render json: @finance.errors, status: :unprocessable_entity
       end
	end

    private
    def finance_params
       params.require(:finance_record).permit(:id, :description, :expense, :value, :processed, :date)
    end
    
	def set_finance
	  @finance = FinanceRecord.find_by_id(params[:id])
	end
end
