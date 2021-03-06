class SessionsController < ApplicationController

	def new
		
	end

	def create
         user = User.find_by_email(params[:session][:email])
         if user && user.authenticate(params[:session][:password])
         	sign_in user
         	redirect_back_or user
         	#redirect_to user
         else
         	flash.now[:error] = 'Invalid email/password combination'
         	render 'new'
         end
		#render :plain => params.inspect
	end
	def destroy
		sign_out
        redirect_to '/'
	end
end
