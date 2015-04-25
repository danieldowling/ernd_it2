class SessionsController < ApplicationController

	def index
		
	end

	def new
	
	end

	def create
		user = User.find_by(email: params[:login][:email])

		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id.to_s
            flash[:welcome] = "Thanks for logging in, #{user.name}"
			redirect_to posts_path
		else
			flash.now[:error] = "Your email address or password are incorrect."
			render :new
		end
	end

	def destroy
    session.delete(:user_id)
    redirect_to home_path
	end
end


