class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.ci_find('username', params[:session][:username])
    # if the user is nil, then the following if statement fails,
    # which is why we test user && user.authenticate(..)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user_url(user)
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
