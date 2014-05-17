class Card < ActiveRecord::Base
	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			where("")
		end
	end

	# input genre is string
	def self.getGenre(genre)
		if genre == "all"
			where("")
		else
			where(:genre => genre.split(","))
		end
		
	end
end
