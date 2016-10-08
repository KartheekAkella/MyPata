class ProfileController < ApplicationController
	def show
		@user = User.find_by_nick params[:nick]
	end

	def menu
	end

	def add_contact
		@contact = User.find_by_nick params[:nick]
		@user = current_user
		@user.follow(@contact)
		redirect_to root_path
		
	end



end
