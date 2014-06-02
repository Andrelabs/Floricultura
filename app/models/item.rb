class Item < ActiveRecord::Base
	self.table_name = "itens"
	belongs_to :produto
	belongs_to :pedido

	validates_presence_of :produto_id , :pedido_id , :quantidade
	validates_numericality_of :quantidade, :greate_than => 0 , :allow_nill => true

	#meodo que pega adiciona a quantidade se o produto já foi clicado
	def incrementar_quantidade(quantidade)
		self.quantidade += quantidade.to_i
	end

	def preco_unitario
		self.produto.preco
	end

	def nome
		self.produto.nome
	end

	def preco_total
		self.produto.preco * self.quantidade
	end

end