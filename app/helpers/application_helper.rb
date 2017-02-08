module ApplicationHelper
	def title
		unless @title.nil?
		   "Ruby on Rails Tutorial Sample App | #{@title}" 
		else
		   "Ruby on Rails Tutorial Sample App"
		end
	end
end
