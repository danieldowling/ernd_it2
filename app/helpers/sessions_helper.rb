module SessionsHelper

	def logged_in?
		session[:user_id] != nil #this makes it so when we 'logout' the current_user wont be set to a value of nil
	end

end
