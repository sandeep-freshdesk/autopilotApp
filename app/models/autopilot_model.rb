class AutopilotModel < ActiveRecord::Base
	require 'rest_client'

	@url = "https://api2.autopilothq.com/v1/contact"
	@autopilotapiKey = "d1be3465d4a74719b2dd6c27faf8c884"
	@contentType = "application/json"

	def self.getData
		puts "get data"
		@response = RestClient.get(@url, { :"Content-Type" => "json" , "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" }	 )
		puts "end of "
	end

end
