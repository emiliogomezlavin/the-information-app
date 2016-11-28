Rails.application.routes.draw do

	root 'users#index'

	#query form routes
	get '/settings', to: "users#user_form", as: 'user_form'
	post '/settings', to: "users#show_user"

end
