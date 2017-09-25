class SessionsController < ApplicationController
  def suport
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      suport
      redirect_to user
    else
      flash[:danger] = t "error_login"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
