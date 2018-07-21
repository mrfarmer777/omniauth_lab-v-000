class SessionsController < ApplicationController
  def create

    #when facebook sends back a request to /auth/facebook/callback
    #this method will find or create the user using the :uid (provider id)
    #woops! Forgot to make the 'auth' helper method once...
    @user=User.find_or_create_by(uid: auth['uid']) do |u|
        #it will use the info hash to assign data about the user to our database
        u.name=auth['info']['name']
        u.email=auth['info']['email']
    end

    #it will log the user in using the session hash
    session[:user_id]=@user.id

    #it will render the welcome template
    render 'welcome/home'
  end

  private

  def auth
    #? pulls the auth hash from the response as a json object
    request.env['omniauth.auth']
  end

end
