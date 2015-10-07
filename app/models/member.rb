class Member < ActiveRecord::Base
	validates :email, :email_format => { :message => "not in correct format" }
	validates :email, uniqueness: true
	
	validates :password, length: 6..20
	
	validates :name, presence: true, length: { maximum: 50 }
	validates :name, format: { :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
	
	has_many :book_transactions
	has_many :suggestions
  	has_many :books, through: :book_transactions

  	before_destroy :active_checkouts?
  	def get_history
  		books = BookTransaction.where(member_id:id).map{|x| x.book}
  		options = ['Checked Out','Returned']
  		h = {}
  		return_value = []
  		books.each do |book|
  			if book.nil?
  				next
  			end
  			unless (h.include? book)
  				h[book]=0
  			end
  			return_value << {book=>options[h[book]]}
  			h[book] = 1 - h[book]
  		end
  		return return_value
  	end
  	def checked_out_books
  		checked_out_books = []
  		books = BookTransaction.where(member_id:id).map{|x| x.book}
		books.uniq.each do |book|
			if(books.count(book).odd?)
				checked_out_books << book
			end
		end
		checked_out_books
	end
	def history
		books = BookTransaction.where(member_id:id).map{|x| x.book}
		#history = Hash.new
	end
	def active_checkouts?
		checked_out_books.empty?
	end
end

