require 'sinatra'

get '/' do  		# Welcome page always lives at '/'
	@crm_app_name = "My CRM"
	erb :index	# index.erb file has to be in the 'views' folder in order to work
end

get '/contacts' do
	erb :contacts
end

# get '/contacts/new' do	
# 	erb :
# end