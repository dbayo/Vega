class Card < ActiveRecord::Base
	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			where("")
		end
	end

	def self.getGenre(genre)
		if genre == "all"
			where("")
		else
			where(:genre => genre)
		end
		
	end
end
