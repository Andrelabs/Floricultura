class ItensController < ApplicationController

	def index
		
	end
	
	def create
		pedido_atual.save
		session[:pedido_id] = pedido_atual.id

		pedido_atual.adicionar_produto(Produto.find(params[:produto_id]), params[:quantidade])

		flaśh[:notice] = "Produto adicionado com sucesso!"
		redirect_to produtos_path
	end

end