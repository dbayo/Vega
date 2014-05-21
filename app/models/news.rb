class News < ActiveRecord::Base
	has_many :node_attachments, :as => :nodeable, :dependent => :destroy
  	has_many :attachments, :through => :node_attachments, class_name: "Attachment"
end
