class AutopilotModelsController < ApplicationController

	require 'rest_client'
	before_filter :admin_user, :only => :destroy

	def index
	 	url =  "https://api2.autopilothq.com/v1/contacts"
		@autopilotContacts = JSON.parse(RestClient.get( url, {:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" }))
	end

	def show
		begin
			url =  "https://api2.autopilothq.com/v1/contact/" + params[:id]
			@autopilotContact = RestClient.get(url, {:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" })
			@autopilotContact = JSON.parse(@autopilotContact)
			puts "ddddddddd==== #{@autopilotContact}"
			#redirect_to autopilot_models_path
		rescue => e
			flash[:notice] = "No contact found"
			puts e
			#redirect_to autopilot_models_path
		end
	end

	def destroy

			puts "sfsddsfdddddd\ndsddd\nsefsdf\n = #{params}"
		url = "https://api2.autopilothq.com/v1/contact/" + params[:id]
		response = JSON.parse(RestClient.delete(url, {:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" }))
		redirect_to autopilot_models_path
	end

	def new
		@autopilotContact = AutopilotModel.new
	end

	def edit
		url =  "https://api2.autopilothq.com/v1/contacts"
		@autopilotContacts = JSON.parse(RestClient.get( url, {:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" }))
		@autopilotContact = AutopilotModel.new
		@autopilotContacts['contacts'].each do |contact|
			if contact["contact_id"] == params[:id]
				@autopilotContact = contact
			end
		end
		@autopilotContact = AutopilotModel.new(@autopilotContact)
		puts "edit 	@autopilotContact ===============\n #{@autopilotContact}" 
		#@autopilotContact = AutopilotModel.find()
	end

	def update


		puts "update sdfs\nsdfsf\ndfgdsg\ndsfgdsfg\nds\n #{params['autopilot_model'].to_json}"
		url =  "https://api2.autopilothq.com/v1/contact"
		json_to_send = {"contact" => params['autopilot_model']}
		json_to_send = json_to_send.to_json
	
		puts "json_to_send = #{json_to_send}"
		#@autopilotContacts = RestClient.post( url,:payload => objSend.to_json ,:headers =>"{:content_type => :json, "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884" })
		

		response = RestClient::Request.new({
			      method: :post,
			      url: url,
			      payload: json_to_send,
			      headers: { content_type: :json , "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884"}
			    }).execute do |response, request, result|
					puts "request =#{request}"
					puts "response =#{response}"
			      case response.code
				      when 400
				        
				      when 200
				        
				      else
				        fail "Invalid response #{response.to_str} received."
				      end
			    end


		redirect_to(autopilot_models_path)
	end

	def create
		puts "create sdfs\nsdfsf\ndfgdsg\ndsfgdsfg\nds\n #{params}"
		

		@autopilotContact = AutopilotModel.new(params[:autopilot_model])
		if @autopilotContact.save
			redirect_to(autopilot_models_path)
		else
			@title = "add new up"
			render 'new'
		end


		url =  "https://api2.autopilothq.com/v1/contact"
		json_to_send = {"contact" => params['autopilot_model']}
		json_to_send = json_to_send.to_json
		response = RestClient::Request.new({
			      method: :post,
			      url: url,
			      payload: json_to_send,
			      headers: { content_type: :json , "autopilotapikey" => "d1be3465d4a74719b2dd6c27faf8c884"}
			    }).execute do |response, request, result|
					puts "request =#{request}"
					puts "response =#{response}"
			      case response.code
				      when 400
				        
				      when 200
				        
				      else
				        fail "Invalid response #{response.to_str} received."
				      end
			    end
			
	end


	private
		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end
end
