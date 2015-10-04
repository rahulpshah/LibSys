class Book < ActiveRecord::Base
	
	validates :isbn, numericality: true, uniqueness:true
	
	validates :name, presence: true, length: { maximum: 50 }

	validates :description, presence: true, length: { maximum: 200 }

	validates :authors, presence: true, length: { maximum: 100 }

	has_many :book_transactions 
  	has_many :members, through: :book_transactions
	#searchkick
end
