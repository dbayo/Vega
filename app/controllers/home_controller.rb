class HomeController < ApplicationController
  # Setea el I18n.locale al lenguage que le pasas por params[:lang]. Lo hace directamente en el application_controller.rb en "set_locale".
  # Esta funcion solo redirecciona a la misma pagina
  def setLanguage
    redirect_to(:back)
  end

	def index
		if user_signed_in?
      redirect_to( explores_path)
		else
			render :action => 'index', :layout => 'landing'
		end
  end

  def history
    if user_signed_in?
      redirect_to( explores_path)
    else
      render :action => 'history', :layout => 'landing'
    end
  end

	def contact
		@navSidebar = "contact"
	end
end
