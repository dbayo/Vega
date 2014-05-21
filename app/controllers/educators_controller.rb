class EducatorsController < ApplicationController
	before_filter :setNavSidebar
	def plan
		@comments = Card.all
		@cards = Card.educators
		@news = News.where(:active => true, :language => I18n.locale)
		@teacherComments = TeacherComment.where(:active => true, :language => I18n.locale)
		@totalPictures = Attachment.count
		@totalComments = Comment.count
		@totalUsers = User.count
		@totalNewUsers = User.where("created_at > ?", 1.month.ago).count
	end

	def editPlan
		@comments = Card.all
		@cards = Card.educators
		@news = News.all
		@teacherComments = TeacherComment.all
	end

	# NEWS
	def addNews
		news = News.create(:title => params[:title], :description => params[:description], :active => true, :language => I18n.locale)
		if !params[:upload].blank?
	      	attachment = news.attachments.create(:file_name => params[:upload], :url => params[:upload], :user_id => current_user.id)
	    end

		redirect_to(:back)
	end
	def removeNews
		news = News.find(params[:id])
    	attachment = news.attachments.first
    	attachment.nodeAttachments.destroy
    	attachment.destroy

    	news.destroy

		redirect_to(:back)
	end
	# END - NEWS

	# TEACHER COMMENTS
	def addTeacherComment
		teacherComment = TeacherComment.create(:teacherName => params[:teacherName], :description => params[:description], :active => true, :language => I18n.locale)
		redirect_to(:back)
	end
	def removeTeacherComment
		teacherComment = TeacherComment.find(params[:id])
    	teacherComment.destroy

		redirect_to(:back)
	end
	# END - TEACHER COMMENTS

	def teach

	end

	private
	def setNavSidebar
		@navSidebar = "educators"
	end
end
