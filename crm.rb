require 'sinatra'

get '/' do  		# Welcome page always lives at '/'
	erb :index	# index.erb file has to be in the 'views' folder in order to work
end