class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
 

    def index
	   	@users = User.all
	  end

	  def new
		  @user = User.new
	  end

	  def create
		  @user = User.new(user_params)

		  if @user.save
		  	 session[:user_id] = @user.id.to_s  #this will allow someone who signs up to be directed to the post index
		  	 flash[:welcome] = "Thanks for signing up, #{@user.name}!"
			 redirect_to posts_path
		  else
			 render :new
		  end
	  end

  private
  def user_params
	 params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access that page!"
      redirect_to home_path
    end
  end

  

end 
