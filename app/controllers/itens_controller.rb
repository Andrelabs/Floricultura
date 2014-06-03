class ItensController < ApplicationController

	def index		
	end

	def create
		pedido_atual.save
		session[:pedido_id] = pedido_atual.id

		pedido_atual.adicionar_produto(Produto.find(params[:produto_id]), params[:quantidade])

		flash[:notice] = "Produto adicionado com sucesso!"
		redirect_to produtos_path
	end
	
	def atualizar_carrinho
		params.permit!
		pedido_atual.update_attributes(params[:pedido])
		flash[:notice] = "Carinnho atualizado com sucesso!"
		redirect_to itens_path
	end

	def destroy
		itens = Item.find(params[:id])
		itens.destroy
		flash[:notice] = "Produto removido com sucesso!"
		if pedido_atual.item.blank?
			flash[:notice] = "Não há itens no carrinho!"
			redirect_to produtos_path
		else
			redirect_to itens_path
		end		
	end
	
end