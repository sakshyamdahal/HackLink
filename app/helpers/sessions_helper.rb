module SessionsHelper

	def sign_in(hacker)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		hacker.update_attribute(:remember_token, Hacker.digest(remember_token))
		self.current_hacker = hacker
	end

	def signed_in?
		!current_hacker.nil?
	end

	def current_hacker=(hacker)
		@current_hacker = hacker
	end

	def current_hacker?(hacker)
		hacker == current_hacker
	end

	def current_hacker
		remember_token = Hacker.digest(cookies[:remember_token])
		@current_user ||= Hacker.find_by(remember_token: remember_token)
	end

	def sign_out
		current_hacker.update_attribute(:remember_token, Hacker.digest(Hacker.new_remember_token))
		cookies.delete(:remember_token)
		self.current_hacker = nil
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to) 
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end

	def signed_in_hacker

		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in"
		end
	end
end
