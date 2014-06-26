class Admin::ProdutosController < Admin::BaseController
	def index
		@produtos = Produto.all.order("id")
	end

	def show
		@produto = Produto.where("id = ?", params[:id])
		@imagens = Imagem.where("produto_id = ?" , params[:id])
	end

	def new
		@produto = Produto.new
		@categoria = CategoriaProduto.where("ativo = ?", true)
	end

	def create

		@produto = Produto.new(produto_params)

		if @produto.save
			flash[:notice] = "Produto salvo com sucesso"
			redirect_to :action => :edit , :id => @produto.id
		else
			@categoria = CategoriaProduto.where("situacao = ?", false)
			render :action => :new
		end
	end

	def edit
		@produto = Produto.find(params[:id])
		@imagens = Imagem.where("produto_id = ?" , params[:id])
		@categoria = CategoriaProduto.find_by_sql("
			SELECT 
				categoria_produtos.id,
				categoria_produtos.nome
			FROM 
				categoria_produtos 
				INNER JOIN produtos ON (produtos.categoria_produto_id = categoria_produtos.id)
			WHERE
				categoria_produtos.id = #{@produto.categoria_produto_id} AND categoria_produtos.ativo = true
			")
	end

	def update
		produto = Produto.find(params[:id])
		produto.update_attributes(produto_params)
		if produto.save
			flash[:notice] = "produto atualizado!"
			redirect_to :action => :show , :id => params[:id]
		else
			@categoria = CategoriaProduto.where("ativo = ?", true)
			render :action => :edit
		end
	end

	def situacao_produto
		@produto = Produto.find(params[:produto_id])
		if params[:acao] == "in"
			@produto.update_attributes(:ativo => false )
		elsif params[:acao] == "at"
			@produto.update_attributes(:situacao => true )
		else
			flash[:error] = "Situação não alterada"
			redirect_to :action => :index
		end
		redirect_to :action => :index
		flash[:notice] = "Produto atualizado com sucesso!"
	end	

	private

		def produto_params
  		params.require(:produto).permit(:nome , :preco , :quantidade , :categoria_produto_id , :descricao)
		end
end