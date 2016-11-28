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
		if User.find_by(email: @email)
			@user = User.find_by(email: @email)
		end
		render :edit_form
	end

	def show_user
		@user = User.validate_user(params["old_email"], params["nonce"], user_params)
		if @user
	    	flash[:notice] = "Succesfully updated information"
	    	render :show_user
	    else
	    	flash[:errors] = "Invalid information. No changes saved"
	    	render :edit_form
	    end
	end

	private
		def user_params
	      params.require(:user).permit(:name, :email, :marketing, :articles, :digest)
	    end

end
