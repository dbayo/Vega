class Card < ActiveRecord::Base
	has_many :node_attachments, :as => :nodeable, :dependent => :destroy
  	has_many :attachments, :through => :node_attachments, class_name: "Attachment"

  	has_many :comments

  	has_many :funFacts

  	has_many :quizzs

	def self.language(lang)
		where(:language => lang)
	end

	def self.bookOfKnowledge()
		where(:bookOfKnowledge => true)
	end

	def self.educators()
		where(:educators => true)
	end

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
