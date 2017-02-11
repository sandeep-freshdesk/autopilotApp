class AutopilotController < ApplicationController
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
end
