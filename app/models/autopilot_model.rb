class AutopilotModel < ActiveRecord::Base

	require 'rest_client'

	def self.getContacts
		puts "get data"
	 	url =  "https://api2.autopilothq.com/v1/contacts"
		response = RestClient.get( url, {:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" })
		puts "end of "
		return JSON.parse(response)
		
	end

	def self.getContact pilotId
		puts "single contact"

	 	url =  "https://api2.autopilothq.com/v1/contact/" + pilotId
	 	puts "url = #{url}"
		response = RestClient.get(url, {:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" })
		
		puts "end of single contact"
		return JSON.parse(response)
	end

	def self.deleteContact pilotId
		puts "delete single"
		url = "https://api2.autopilothq.com/v1/contact/" + pilotId
		puts "url = #{url}"
		response = RestClient.delete(url, {:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" })
		puts "delete response  = #{response}"
		puts "end of single delete contact"
		return JSON.parse(response)
		
	end

end
