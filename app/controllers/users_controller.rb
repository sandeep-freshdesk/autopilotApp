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
			flash[:success] = "Welcome to the Sample App!"
			puts "sfdsdf \n sdfsdfs \n sdfsdf\n sdf\n sfsdf\n sdfsd\n \nsfdsdf\nsdfsdf"
			redirect_to @user
		else 
			@title = 'Sign Up'
			render 'new'
		end
		
	end

	private 
		def user_params
			params(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
