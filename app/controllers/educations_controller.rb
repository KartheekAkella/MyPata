class EducationsController < ApplicationController
before_action :set_education, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

	def index
		@educations = current_user.educations
	end


	def show
  	end


	def new 
		@education = current_user.educations.build
	end

	def create
		@education = current_user.educations.build(education_params)

		if @education.save
			redirect_to @education
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @education.update(education_params)    
                redirect_to @education    
            else   
                render 'edit'    
            end 
	end

	def destroy
		@education.destroy
		
		render 'index'
	end

	private

	def set_education
		@education = current_user.educations.find(params[:id])
	end

	def education_params
		params.require(:education).permit(:institute, :details, :active, :start_date, :end_date)
	end

end
