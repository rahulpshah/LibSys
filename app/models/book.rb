class Book < ActiveRecord::Base
	has_many :book_transactions 
  	has_many :members, through: :book_transactions
	#searchkick
end
