class SessoesController < ApplicationController
	def new	
	end

	def create		
		usuario = Usuario.atenticar(params[:email] , params[:senha])

		if usuario
			session[:usuario_id] = usuario.id

			#verifica se os dados estão atualizados
			if usuario.cpf.blank?
				flash[:info] = "Você precisa atualizar algumas informações!"
				redirect_to cadastro_path
			else
				flash[:success] = "Bem vindo #{usuario.nome} #{usuario.sobrenome}"
				if usuario.anuciante == false
					redirect_to root_url
				else
					redirect_to admin_path
				end
			end
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