class ItensController < ApplicationController

	def index		
	end

	def create
		pedido_atual.save
		session[:pedido_id] = pedido_atual.id

		pedido_atual.adicionar_produto(Produto.find(params[:produto_id]), params[:quantidade])

		flash[:success] = "Produto adicionado com sucesso!"
		redirect_to :controller => :produtos , :action => :index
	end
	
	def atualizar_carrinho
		params.permit!
		pedido_atual.update_attributes(params[:pedido])
		flash[:success] = "Carinnho atualizado com sucesso!"
		redirect_to :action => :index
	end

	def destroy
		itens = Item.find(params[:id])
		itens.destroy
		flash[:info] = "Produto removido com sucesso!"
		if pedido_atual.item.blank?
			flash[:info] = "Não há itens no carrinho!"
			redirect_to :controller => :produtos , :action => :index
		else
			redirect_to :action => :index
		end		
	end
	
end