class InvitesController < ApplicationController

 def index
    some_token = params[:token]
    @contacts = GmailContacts::Google.new("some_token").contacts
  end


end