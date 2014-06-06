class SessoesController < ApplicationController
	def new	
	end

	def create		
		usuario = Usuario.atenticar(params[:email] , params[:senha])

		if usuario
			session[:usuario_id] = usuario.id
			flash[:success] = "Bem vindo #{usuario.nome} #{usuario.sobrenome}"
			redirect_to root_url
		else
			flash[:danger] = "Usuário ou senha inválidos"
			redirect_to :action => :new
		end
	end

	def destroy
  		session[:usuario_id] = nil
  		redirect_to entrar_path
  		flash[:success] = "Voce deslogou com sucesso!"
  end

end