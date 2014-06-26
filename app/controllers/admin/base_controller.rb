class Admin::BaseController < ApplicationController
	layout "admin"
	#before_filter :loged_user

	def system(value)
		system = `#{value}`
	end
	
	private
	
	#def loged_user	
		#if session[:usuario_id].blank?
			#flash[:danger] = "Você não está logado por favor realize seu login"
			#redirect_to root_url
		#else
			#@current_user ||= Usuario.find(session[:usuario_id])
		#end

		#if current_user.anuciante == false
			#flash[:danger] = "Você não é anuciante por favor migre sua conta!"
			#redirect_to root_url
		#end
	#end
end