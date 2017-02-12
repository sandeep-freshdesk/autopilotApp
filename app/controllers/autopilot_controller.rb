class AutopilotController < ApplicationController
	before_filter :admin_user, :only => :destroy

	def index
		@autopilotContacts = AutopilotModel.getContacts
		puts "in autopilot contacts = #{@autopilotContacts}"
	end

	def show
		puts "sfds\nsdfs\sdf\n\sdf\nsfdsdf\nsdfsd\nsdfs\nsgfs\n"
		@autopilotContact = AutopilotModel.getContact(params[:pilotId])
		puts "autopilotContact = #{@autopilotContact}"
	end

	def destroy
		puts "delete sfds\nsdfs\sdf\n\sdf\nsfdsdf\nsdfsd\nsdfs\nsgfs\n"
		puts "#{params[:pilotId]}"
		@autopilotContact = AutopilotModel.deleteContact(params[:pilotId])
		puts "delete respo in controller = #{@autopilotContact}"

		redirect_to autopilotContacts_path
	end

	private
		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end
end
