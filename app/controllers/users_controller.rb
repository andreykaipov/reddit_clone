class UsersController < ApplicationController
  # confirm logged in and correct user only before edit and update actions
  before_action(:logged_in_user, only: [:index, :edit, :update,
                                        :following, :followers])
  before_action(:correct_user, only: [:edit, :update])
  # confirm admin user before destroy action
  before_action(:admin_user, only: :destroy)

  # This action creates a @user that will be usable in our new.html.erb view.
  def new
    @user = User.new   
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  # Declaring our variables in our controller as instance variables
  # (@var) makes them available to us in our view.
  # The params hash is inherent to every web-page.
  # Since we'd like to show a user on the URL /users/:id, the params hash
  # looks like params = {controller: users, action: show, id: number}.
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Thanks for signing up!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private

    def user_params
      return params.require(:user).permit(:username, :password,
                           :password_confirmation, :email, :avatar);
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
