class WorksController < ApplicationController
before_action :set_work, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

	def index
		@works = current_user.works
	end


	def show
  	end


	def new 
		@work = current_user.works.build
	end

	def create
		@work = current_user.works.build(work_params)

		if @work.save
			redirect_to @work
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @work.update(work_params)    
                redirect_to @work    
            else   
                render 'edit'    
            end 
	end

	def destroy
		@work.destroy
		
		render 'index'
	end

	private

	def set_work
		@work = current_user.works.find(params[:id])
	end

	def work_params
		params.require(:work).permit(:company, :details, :active, :start_date, :end_date)
	end

end
