require 'cgi'

class UsersController < ApplicationController

	def index
		@users = User.all
		render :index
	end

	def user_form
		url = request.original_url
		uri = URI.parse(url)
		@query_params = CGI.parse(uri.query)
		@email = @query_params["email"][0]
		@nonce = @query_params["nonce"][0]
		@user = User.find_by(email: @email)
		render :edit_form
	end

	def show_user
		binding.pry
		User.validate_user(params["old_email"], params["nonce"], user_params)
		@user = User.new(user_params)
		if @user.save
	    	flash[:notice] = "Succesfully updated User information"
	    	render :show_user
	    else
	    	flash[:error] = @user.errors.full_messages.to_sentence
	    	render :edit_form
	    end
	end

	private
		def user_params
	      params.require(:user).permit(:name, :email, :marketing, :articles, :digest)
	    end

end
