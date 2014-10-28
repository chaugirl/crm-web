require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex = Rolodex.new

#routes
get '/' do  		# Welcome page always lives at '/'
	@crm_app_name = "My CRM"
	erb :index	# index.erb file has to be in the 'views' folder in order to work
end


get "/contacts" do
	# faking the data by entering a contacts array
	# @contacts = []
	# @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
	# @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
	# @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

