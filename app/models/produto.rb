class Produto < ActiveRecord::Base
	#self.table_name = "produtos"
	has_many :imagem

end