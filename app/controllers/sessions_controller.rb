class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      flash[:success] = "Signed in as #{current_user.name}!"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Successfully logged out!"
    redirect_to root_path
  end
end
