class SessionsController < ApplicationController
  def create

    #when facebook sends back a request to /auth/facebook/callback
    #this method will find or create the user using the :uid (provider id)
    #it will use the info hash to assign data about the user to our database
    #it will log the user in using the session hash
    #it will render the welcome tempalte
    @user.User.find_or_create_by(uid: auth['uid']) do |u|
        u.name=auth['info']['name']
        u.email=auth['info']['email']
        u.image=auth['info']['image']
    end

    session[:user_id]=@user.id

    render 'welcome/home'
  end

end
