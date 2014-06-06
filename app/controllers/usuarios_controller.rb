class UsuariosController < ApplicationController
	def index
		
	end

	def new
		@usuario = Usuario.new
	end

	def create		
		@usuario = Usuario.new(usuario_params)
		if @usuario.save
			flash[:success] = "Conta criada com sucesso!"
			#se criar o usuário ele loga rideto o sistema
			usuario = Usuario.atenticar(params[:email] , params[:senha])
			redirect_to root_url		
		else
			render :action => :new
		end
	end



	private
		def usuario_params
			params.require(:usuario).permit!
		end

end