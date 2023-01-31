class SessionsController < ApplicationController

  def new
  end

  def create
    
      if authenticate_with_credentials(params[:email], params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/sign_in'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sign_in'
  end

end