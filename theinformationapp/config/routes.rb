Rails.application.routes.draw do

	root 'users#index'

	#query form routes
	get '/users/edit', to: "users#user_form", as: 'user_form'
	post '/users/edit', to: "users#show_user"

end
