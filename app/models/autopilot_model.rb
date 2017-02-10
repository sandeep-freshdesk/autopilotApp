class AutopilotModel < ActiveRecord::Base
	require 'rest_client'

	@url = "https://api2.autopilothq.com/v1/contact"

	def self.getData
		puts "get data"
		debugger
		@response = RestClient.get(@url,{:content_Type => "application/json", "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884"})
		puts "end of "
	end

end
