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
		@user = User.find(params[:id])
		if @user.consume
	      flash[:success] = "Welcome to FAR!"
	      render :show_user
	    else
	      redirect_to user_form, flash: {error: @user.errors.full_messages.to_sentence}
	    end

		render :show_user
	end

	private
		def user_params
	      params.require(:user).permit(:name, :email, :marketing, :articles, :digest)
	    end

end
