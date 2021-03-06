class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	# Removed User sign up...
	# devise :database_authenticatable, :registerable,
	#      :recoverable, :rememberable, :trackable, :validatable

	devise :database_authenticatable, 
			:rememberable, :trackable, :validatable

	acts_as_voter
end
