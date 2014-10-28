require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

get '/' do  		# Welcome page always lives at '/'
	@crm_app_name = "My CRM"
	erb :index	# index.erb file has to be in the 'views' folder in order to work
end


get "/contacts" do
	@contacts = []
	@contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
	@contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
	@contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

	erb :contacts
end
