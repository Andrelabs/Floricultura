class Pedido < ActiveRecord::Base
	self.table_name = "pedidos"
	has_many :itens
	has_many :produtos, :through => :items

	def adicionar_produto(produto, quantidade)
		if item = self.itens.detect { |elemento| elemento.produto == produto  }
			item.incrementar_quantidade(quantidade)
			item.save
		else
			self.itens.create(:produto => produto , :quantidade => quantidade)
		end
	end

end