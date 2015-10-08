class NotifyMailer < ApplicationMailer
	 default from: "no-reply@libsys.com"

	def notify(user,book)
		#raise error
  	  	@user = user
  	  	@book = book
    	mail(to: @user.email, subject: 'Book you requested is available!')
  end
end
