class EducatorsController < ApplicationController
	before_filter :setNavSidebar
	def plan
		@news = News.where(:active => true, :language => I18n.locale)
		@teacherComments = TeacherComment.where(:active => true, :language => I18n.locale)
		@totalPictures = Attachment.count
		@totalComments = Comment.count
		@totalResources = @resources = SystemVar.initSystemVar("resources").attachments.count
		@totalUsers = User.count
		@totalNewUsers = User.where("created_at > ?", 1.month.ago).count
	end

	def teach
		@cards = Card.educators.language(I18n.locale).where(:genre => "activities")
		@educationalOutcome = SystemVar.getDescription("educationalOutcome")
		@resources = SystemVar.initSystemVar("resources").attachments
	end

	private
	def setNavSidebar
		@navSidebar = "educators"
	end
end
