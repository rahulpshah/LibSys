class Member < ActiveRecord::Base
	validates :email, :email_format => { :message => "not in correct format" }
	validates_uniqueness_of :email
	validates :password, length: 6..20
	validates :name, presence: true
end
