class ProfileController < ApplicationController
	def show
		@user = User.find_by_nick params[:nick]
	end

	def menu
	end

	def add_contact
		
		
	end



end
