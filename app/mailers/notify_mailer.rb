class NotifyMailer < ApplicationMailer
	 default from: "no-reply@libsys.com"

	def notify(user)
  	  @user = user
    	mail(to: @user.email, subject: 'Book you requested is available!')
  end
end
