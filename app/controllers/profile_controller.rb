class ProfileController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def menu
	end

	def add_contact
		@contact = User.find(params[:id])
		@user = current_user
		@user.follow(@contact)
		redirect_to root_path
		
	end



end
