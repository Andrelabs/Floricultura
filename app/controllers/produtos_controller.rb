class ProdutosController < ApplicationController

	def index
		@produtos = Produto.all.order("id")
	end

end