class Pedido < ActiveRecord::Base
	#self.table_name = "pedidos"
	has_many :item
	has_many :produto, :through => :item

	#para aninhar os objetos em umapágina
	accepts_nested_attributes_for :item

	#metofo que adiciona o produto na tabela itens 
	def adicionar_produto(produto, quantidade)
		if item = self.item.detect { |elemento| elemento.produto == produto  }
			item.incrementar_quantidade(quantidade)
			item.save
		else
			self.item.create(:produto => produto , :quantidade => quantidade)
		end
	end

	def preco_total
		self.item.inject(0) do |acomulado , item|
			acomulado + item.preco_total
		end
	end

end