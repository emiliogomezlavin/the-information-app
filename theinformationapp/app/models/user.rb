class User < ActiveRecord::Base

	validates :name, :email, presence: true
	validates :email, confirmation: true, uniqueness: true
	# validates :password, presence: true, confirmation: true, on: :create
	# validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

end
