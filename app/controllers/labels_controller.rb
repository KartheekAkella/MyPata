class LabelsController < ApplicationController
	before_action :set_label, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

	def index
		@labels = current_user.labels
	end


	def show
  	end


	def new 
		@label = current_user.labels.build
	end

	def create
		@label = current_user.labels.build(label_params)

		if @label.save
			redirect_to @label
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @label.update(label_params)    
                redirect_to @label    
            else   
                render 'edit'    
            end 
	end

	def destroy
		@label.destroy
		
		render 'index'
	end

	private

	def set_label
		@label = current_user.labels.find(params[:id])
	end

	def label_params
		params.require(:label).permit(:name, :field)
	end

end
