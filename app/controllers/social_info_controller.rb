class SocialInfoController < ApplicationController
	before_action :set_social_info, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

	def index
		@social_info = current_user.social_info
		if @social_info.nil?
			redirect_to new_social_info_path
		else
			redirect_to social_info_path(@social_info)
		end
	end

	def show
	end


	def new 
		@social_info = current_user.build_social_info
	end

	def create
		@social_info = current_user.build_social_info(social_info_params)

		if @social_info.save
			redirect_to @social_info
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @social_info.update(social_info_params)    
                render 'show'  
            else   
                render 'edit'    
            end 
	end

	def destroy
		@social_info.destroy
		
		redirect_to social_info_index_path
	end

	private

	def set_social_info
		@social_info = current_user.social_info(params[:id])
	end

	def social_info_params
		params.require(:social_info).permit(:fb, :twitter, :website, :linkedin)
	end

end
