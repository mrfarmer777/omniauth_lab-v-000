class SessionsController < ApplicationController
  def create

    @user.User.find_or_create_by(uid: auth['uid']) do |u|
        u.name=auth['info']['name']
        u.email=auth['info']['email']
        u.image=auth['info']['image']
      end
  end

end
