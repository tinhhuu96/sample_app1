class SessionsController < ApplicationController
  def suport user
    params[:session][:remember_me] == Settings.session.value_checkbox ? remember(user) : forget(user)
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      suport user
      redirect_back_or user
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
