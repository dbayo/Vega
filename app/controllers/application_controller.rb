class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  def set_locale
	    if user_signed_in? 
			if current_user.language.blank?
				extract_locale_from_accept_language_header
			else
				I18n.locale = current_user.language
			end
	    else
			session[:lang] = params[:lang] if params[:lang]
			I18n.locale = session[:lang] || extract_locale_from_accept_language_header
	    end
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
