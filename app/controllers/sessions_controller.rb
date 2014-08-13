class SessionsController < ApplicationController
	include SessionsHelper
	def new
		puts("URL ===> #{url_for(controller: "sessions", action: "new")}")
	end

	def create
		puts("URL ===> #{url_for(controller: "sessions", action: "create")}")
		@user = User.find_by(email: params[:session][:email])
		if (@user)
			if (@user.authenticate(params[:session][:password]))
				flash.now[:success] = "success!"
				signin @user
				redirect_to @user
			else
				flash.now[:error] = "invalid email/password"
				render "new"
			end
		end
	end

	def destroy
		puts("URL ===> #{url_for(controller: "sessions", action: "destroy")}")
		sign_out 
		redirect_to root_url
	end
end
