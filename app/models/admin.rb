class Admin < ActiveRecord::Base
	validates :email, :email_format => { :message => "not in correct format" }
	validates :email, uniqueness: true

	validates :password, length: 6..20
	
	validates :name, presence: true, length: { maximum: 50 }
	validates :name, format: { :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

	before_destroy :editable?

  	def editable?
    	email != "admin@admin.com"
  	end
end
