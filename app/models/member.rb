class Member < ActiveRecord::Base
	def is_admin?
		return respond_to?(:give_rights)
	end
end
