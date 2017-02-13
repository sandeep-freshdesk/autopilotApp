class AutopilotModel < ActiveRecord::Base

	attr_accessible :FirstName, :Email,:LastName,:_NewEmail

	require 'rest_client'

end
