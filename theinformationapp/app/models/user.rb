class User < ActiveRecord::Base

	belongs_to :token

	validates :name, :email, presence: true
	validates :email, confirmation: true, uniqueness: true
	# validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


	def self.validate_user(old_email, nonce, user)
		@token = Token.find_by(nonce: nonce)
		if @token
			@user = @token.user
			if @user.email === old_email
				if old_email != user["email"]
					@user.email = user["email"]
				end
				@user.marketing = user["marketing"]
				@user.articles = user["articles"]
				@user.digest = user["digest"]
				@user.save
				return @user
			else
				return nil
			end
		else
			return nil
		end
	end
	
end
