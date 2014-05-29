class Item < ActiveRecord::Base
	self.table_name = "itens"
	belongs_to :produto
	belongs_to :pedido

	validates_presence_of :produto_id , :pedido_id , :quantidade
	validates_numericality_of :quantidade, :greate_than => 0 , :allow_nill => true

	def incrementar_quantidade(quantidade)
		self.quantidade += quantidade
	end

end