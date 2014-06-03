class Admin::ProdutosController < Admin::BaseController
	def index
		@produtos = Produto.all.order("id")
	end

	def show
		@produto = Produto.where("id = ?", params[:id])		
	end

	def new
		@produto = Produto.new
	end

	def create

		@produto = Produto.new
		@produto.nome = params[:produto][:nome] if params[:produto][:nome]
		@produto.preco = params[:produto][:preco] if params[:produto][:preco]
		@produto.quantidade = params[:produto][:quantidade] if params[:produto][:quantidade]
		@produto.descricao = params[:produto][:descricao] if params[:produto][:descricao]
		

		if @produto.save 
			flash[:notice] = "Produto salvo com sucesso"
			redirect_to :action => :index
		else
			render :action => :new
		end
	end

	def edit
		@produto = Produto.find(params[:id])
	end

	def update
		@produto = Produto.find(params[:id])
		@produto.nome = params[:produto][:nome] if params[:produto][:nome]
		@produto.preco = params[:produto][:preco] if params[:produto][:preco]
		@produto.descricao = params[:produto][:descricao] if params[:produto][:descricao]
		@produto.quantidade = params[:produto][:quantidade] if params[:produto][:quantidade]
		
		if @produto.save
			flash[:notice] = "produto atualizado!"
			redirect_to :action => :show , :id => params[:id]
		else
			render :action => :edit
		end
	end

	def situacao_produto
		@produto = Produto.find(params[:produto_id])
		if params[:acao] == "in"
			@produto.update_attributes(:situacao => true )
		elsif params[:acao] == "at"
			@produto.update_attributes(:situacao => false )
		else
			flash[:error] = "Situação não alterada"
			redirect_to :action => :index
		end
		redirect_to :action => :index
		flash[:notice] = "Produto atualizado com sucesso!"
	end	

	private

		def produto_params
  		params.require(:produto).permit(:imagem)
		end
end