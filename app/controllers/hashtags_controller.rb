class HashtagsController < ApplicationController
before_action :set_hashtag, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

	def index
		@hashtag = current_user.hashtag
		if @hashtag.nil?
			redirect_to new_hashtag_path
		else
			redirect_to hashtag_path(@hashtag)
		end
	end

	def show
	end


	def new 
		@hashtag = current_user.build_hashtag
	end

	def create
		@hashtag = current_user.build_hashtag(hashtag_params)

		if @hashtag.save
			redirect_to @hashtag
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @hashtag.update(hashtag_params)    
                render 'show'  
            else   
                render 'edit'    
            end 
	end

	def destroy
		@hashtag.destroy
		
		redirect_to hashtag_index_path
	end

	private

	def set_hashtag
		@hashtag = current_user.hashtag(params[:id])
	end

	def hashtag_params
		params.require(:hashtag).permit(:fb, :twitter, :website, :linkedin)
	end
	
end
