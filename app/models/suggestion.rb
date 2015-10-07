class Suggestion < ActiveRecord::Base
	belongs_to :member
	def get_book
		h = as_json
		h.delete("id")
		h.delete("created_at")
		h.delete("updated_at")
		return Book.new(h)
	end
end
