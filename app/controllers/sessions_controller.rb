class SessionsController < ApplicationController
  def new

  end
  def create
    puts "FUCk yuo"
    user = nil
    admin = Admin.find_by(email: params[:session][:email].downcase)
    member = Member.find_by(email: params[:session][:email].downcase)
    user ||= admin
    user ||= member
    if user && user.password == (params[:session][:password])

      flash[:notice] = "Welcome #{user.class.to_s} to LibSys!"
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
    #elsif member && member.password == (params[:session][:password])
  	#	flash[:notice] = "Welcome Member to the LibSys!"
  	#	log_in member
  	#	redirect_to member
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:notice] = 'Invalid email/password combination'
  	  render 'new'
  	end
  end
  def destroy
    log_out
    redirect_to root_path
  end
end
