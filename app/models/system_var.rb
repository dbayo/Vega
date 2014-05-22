class SystemVar < ActiveRecord::Base
	has_many :node_attachments, :as => :nodeable, :dependent => :destroy
  	has_many :attachments, :through => :node_attachments, class_name: "Attachment"

  	def self.initSystemVar(code)
  		(self.where(:code => code).exists?) ? self.where(:code => code).first : self.create(:code => code, :description => "")
  	end

	def self.getDescription(code)
		self.initSystemVar(code).description
	end

	def self.setDescription(code, description)
		self.initSystemVar(code).update_attributes(:description => description)
	end
end
