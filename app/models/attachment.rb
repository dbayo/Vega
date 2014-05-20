class Attachment < ActiveRecord::Base
	has_many :nodeAttachments
	attr_accessor :file_name, :url, :user_id
	mount_uploader :file_name, ImageUploader

	def getPhoto(width = 50, height = 50)
		return '<img src="'+self.file_name.to_s+'" style="width: '+width.to_s+'px; height: '+height.to_s+'px;">'
	end

	def self.cropImage(file_name, x1, y1, x2, y2)
		image = Magick::Image.read("#{Rails.root}/public#{file_name}").first
	    fr1 = image.crop(x1, y1, x2, y2, true)

	    list = Magick::ImageList.new
	    list << fr1
	    list.iterations = 0

	    # gotta packet the file
	    list.write("#{Rails.root}/public#{file_name}")
	end
end
