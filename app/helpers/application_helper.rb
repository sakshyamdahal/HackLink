module ApplicationHelper
	
	def signed_in_hacker

		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in"
		end
	end
end
