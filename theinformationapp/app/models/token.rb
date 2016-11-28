class Token < ActiveRecord::Base

	has_one :user

	def self.generate(user)
		# 64-bit nonce
		@nonce = [*('a'..'z'),*('0'..'9')].shuffle[0,32].join
		@token = Token.create({nonce: @nonce})
		user.token_id = @token.id
		user.save
	end

	def self.consume(nonce)
		@token = Token.find_by(nonce: nonce)
		if @token
			@user = @token.user
			@token.user = nil
			@token.destroy
			return @user
		else
			return nil
		end
	end

end
