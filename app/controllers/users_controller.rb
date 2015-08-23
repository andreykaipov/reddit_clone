class UsersController < ApplicationController
  
  # This action creates a @user that will be usable in our new.html.erb view.
  def new
    @user = User.new   
  end

  # Declaring our variables in our controller as instance variables
  # (@var) makes them available to us in our view.
  # The params hash is inherent to every web-page.
  # Since we'd like to show a user on the URL /users/:id, the params hash
  # looks like params = {controller: users, action: show, id: number}.
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for signing up for nothing!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      return params.require(:user).permit(:username, :password,
                           :password_confirmation, :email);
    end
end
