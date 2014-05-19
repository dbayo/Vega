class HomeController < ApplicationController
	def index
		if user_signed_in?
  			render :action => 'index', :layout => 'application'
  		else
  			render :action => 'index', :layout => 'landing'
  		end
  	end

  	def contact
  		
  	end
end
