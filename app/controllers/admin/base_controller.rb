class Admin::BaseController < ApplicationController
	layout "admin"
	before_filter :loged_user
	
	private
	
	def loged_user	
		if session[:user_id].blank?
			flash[:danger] = "Você não está logado por favor realize seu login"
			redirect_to root_url
		else
			@current_user ||= User.find(session[:user_id])
		end
	end
end