class UsersController < ApplicationController
  include SessionsHelper
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		#handle shits
  		puts("---> saving successful")
  		flash[:success] = "Welcome to Sample App"
      signin @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  def show
  	@user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
