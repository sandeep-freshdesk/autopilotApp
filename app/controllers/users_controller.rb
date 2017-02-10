class UsersController < ApplicationController
	def new
		@title = "sign up"
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@title = @user.name
	end

	def create
		@user = User.new(params[:user])
		if @user.save
		sign_in @user
		flash[:success] = "Welcome to the Sample App!"
		redirect_to @user
		else
		@title = "Sign up"
		render 'new'
		end
	end

	private 
		def user_params
			params(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
