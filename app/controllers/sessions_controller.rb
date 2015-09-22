class SessionsController < ApplicationController
  def new

  end
  def create
  	member = Member.find_by(email: params[:session][:email].downcase)
  	if member && member.password == (params[:session][:password])
  		flash[:notice] = "Welcome to the Sample App!"
  		log_in member
  		redirect_to member
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:danger] = 'Invalid email/password combination'
  	  render 'new'
  	end
  end
  def destroy
  end
end
