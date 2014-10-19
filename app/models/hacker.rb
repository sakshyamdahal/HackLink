class Hacker < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: true, length: {maximum: 50}

		# a valid email regex
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, 
				uniqueness: {case_sensitive: false}
	validates :password, length: {minimum: 6}
	validates :username, presence: true, length: {minimum: 4, maximum: 20},
				uniqueness: {case_sensitive: false}
	has_secure_password

	def Hacker.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Hacker.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token = Hacker.digest(Hacker.new_remember_token)
		end
end
