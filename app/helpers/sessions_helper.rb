module SessionsHelper

	def sign_in(user)
		
	     cookies[:remember_token] = {value:user.remember_token,
	                                  expires:20.years.from_now}
         # The above can be written as follows
           #cookies.permanent[:remember_token] = user.remember_token 
         self.current_user = user  # calls current_user=(user) method which is a setter method
	end

	def signed_in?
		!current_user.nil? # this means the current_user exists in the session
	end

	def current_user=(user)
		@current_user = user		
	end

	def current_user
		@current_user = @current_user || 
		                 User.find_by_remember_token(cookies[:remember_token])
		# the above statement can be written with the anology x = x + 1 is same as x += 1

		#@current_user ||= user.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end
