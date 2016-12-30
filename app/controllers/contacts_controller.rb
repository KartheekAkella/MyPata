class ContactsController < ApplicationController
before_action :set_contact, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!
def index
    @contacts = current_user.contacts
end

def new
@contact = current_user.contacts.build
end
def create
	@contact = current_user.contacts.build(contact_params)

		if @contact.save
			redirect_to @contact
		else
			render 'new'
		end
end
def edit
	
end
def update
	if @contact.update(contact_params)    
                redirect_to @contact   
            else   
                render 'edit'    
            end 
	
end
def destroy
@contact.destroy
		
		render 'index'
end

def set_contact
		@contact = current_user.contacts.find(params[:id])
	end
def contact_params
		params.require(:contact).permit(:contact_nick,:label,:user_id)
	end

end

