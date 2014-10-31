require 'sinatra'
require 'data_mapper'
require_relative 'contact'
require_relative 'rolodex'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

$rolodex = Rolodex.new
#Fake data
$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

#routes
get '/' do  		# Welcome page always lives at '/'
	@crm_app_name = "My CRM"
	erb :index	# index.erb file has to be in the 'views' folder in order to work
end


get '/contacts' do
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

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
	#puts params #inspect the data submitted by form
				#outputs a hash in the log output (terminal)
end

# get '/contacts/1000' do --> finding a contact with the id 1000
get "/contacts/:id" do 
	#making a generalized route so we don't have to create a single route for each individual contact
	@contact = $rolodex.find(params[:id].to_i)
	if @contact #if contact exists
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put "/contacts/:id" do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.note = params[:note]

		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		$rolodex.remove_contact(@contact)
		redirect to "/contacts"
	else
		raise Sinatra::NotFound
	end
end
