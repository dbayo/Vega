class AdminController < ApplicationController
	def index

	end

	def editEducatorsPlan
		@comments = Card.all
		@cards = Card.educators
		@news = News.all
		@teacherComments = TeacherComment.all

		render :template => "/admin/educators/editPlan"
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

	def editEducatorsTeach
		@educationalOutcome = SystemVar.getDescription("educationalOutcome")
		@cards = Card.educators.language(I18n.locale).where(:genre => "activities")
		@attachments = SystemVar.initSystemVar("resources").attachments

		render :template => "/admin/educators/editTeach"
	end

	def editEducationalOutcome
		SystemVar.setDescription("educationalOutcome", params[:description])
		redirect_to(:back)
	end

	def addResource
		resource = SystemVar.initSystemVar("resources")
		if !params[:upload].blank?
	      	attachment = resource.attachments.create(:file_name => params[:upload], :url => params[:upload], :user_id => current_user.id)
	    end
		redirect_to(:back)
	end

	def removeResource
		attachment = Attachment.find(params[:id])
	    attachment.nodeAttachments.destroy
	    attachment.destroy

	    redirect_to(:back)
	end

end
