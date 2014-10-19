class SessionsController < ApplicationController
  def new

  end

  def create
  	hacker = Hacker.find_by(username: params[:session][:username].downcase)
  	if hacker && hacker.authenticate(params[:session][:password])
  		sign_in hacker
  		redirect_back_or hacker
  	else
  		flash.now[:error] = "Invalid username or password"
  		render 'new'
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end
end
