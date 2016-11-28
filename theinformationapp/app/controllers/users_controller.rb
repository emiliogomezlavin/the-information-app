class UsersController < ApplicationController

	def index
		@users = User.all
		render :index
	end

	def user_form
		@user = User.new()
		render :edit_form
	end

	def show_user
		binding.pry
		@user = User.new(user_params)
		if @user.save
	      flash[:notice] = "Succesfully updated User information"
	      render :show_user
	    else
	      redirect_to user_form, flash: {error: @user.errors.full_messages.to_sentence}
	    end
	end

	private
		def user_params
	      params.require(:user).permit(:name, :email, :marketing, :articles, :digest)
	    end

end
