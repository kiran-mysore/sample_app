class SessionsController < ApplicationController

	def new		
	end

	def create
		user = User.find_by_email(params[:session][:email])

		if user && user.authenticate(params[:session][:password])
			 
		   sign_in user  
		# sign_in is a method in SessionsHelper 
		#, but can be made in a different module in the controllers. 
		# Currently it is in the views, hence it is been included in
		# the Application controller.
		   redirect_to user
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
		
	end

	 def destroy	
	    sign_out
	    redirect_to root_path	
	 end
end
