class ProdutosController < ApplicationController

	def index
		#@produtos = Produto.all.order("id")
		#@imagens = Imagem.where("capa = " , true).order("produto_id")


		@produtos = Imagem.find_by_sql("
			SELECT
				*
			FROM
				imagens
				INNER JOIN produtos ON (produtos.id = imagens.produto_id)
			WHERE
				imagens.capa = true
			ORDER BY
				produtos.id
		")
	end



end