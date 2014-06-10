class ProdutosController < ApplicationController

	def index
		@produtos = Produto.find_by_sql("
			SELECT
			 produtos.nome,
			 produtos.preco,
			 produtos.quantidade,
			 produtos.situacao,
			 usuarios.nome AS anuciante 
			FROM 
				produtos
				INNER JOIN usuarios ON (usuarios.id = produtos.anuciante_id)
			ORDER BY
				produtos.id 
		")
	end

end