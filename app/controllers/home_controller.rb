class HomeController < ApplicationController
  
  skip_before_action :authenticate_user!, :except => [:index]
  def index
  end

  def landing
  NotifierMailer.welcome(params[:email]).deliver_now
  if params[:key] == 'Aq17sZh'
   redirect_to new_user_session_path
else
	flash[:errors] = "invalid key enter key again"
    	
    end
   end
  

end
