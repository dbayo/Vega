class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :set_locale
	before_filter :set_path

	def set_locale
		session[:lang] = params[:lang] if params[:lang]
		I18n.locale = session[:lang] || extract_locale_from_accept_language_header
	end

	def set_path
		redirect_to "/users/sign_in" if request.fullpath == root_path
	end

	def after_sign_in_path_for(resource_or_scope)
      	explores_path
	end

	def after_sign_out_path_for(resource_or_scope)
		new_user_session_path
	end

	private
	def extract_locale_from_accept_language_header
		if request.env['HTTP_ACCEPT_LANGUAGE'].nil?
			return 'en'
		else
			request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first || I18n.default_locale
		end
	end
end
