class Admin::CategoriaProdutosController < Admin::BaseController

	def index
		@categoria = CategoriaProduto.where("situacao = ?" , false)
	end

	def new
		@categoria = CategoriaProduto.new
	end

	def create
		categoria = CategoriaProduto.new(categoria_params)
		if categoria.save
			flash[:success] = "Categoria Criada com sucesso!"
			redirect_to admin_categoria_produtos_path
		else
			flash[:danger] = "Erro! por favor verifique o cadastro"
			render :new
		end
	end

	def edit
		@categoria = CategoriaProduto.find(params[:id])
	end

	def update
		categoria = CategoriaProduto.find(params[:id])
		categoria.update_attributes(categoria_params)
		if categoria.save			
			redirect_to admin_categoria_produtos_path
			flash[:success] = "Categoria Atualizada com sucesso!"
		else
			flash[:danger] = "Erro! por favor verifique o cadastro"
			render :edit
		end
	end

	def destroy
		categoria = CategoriaProduto.find(params[:id])
		categoria.update_attributes(:situacao => true)

		flash[:success] = "Produto removido com sucesso!"
		redirect_to admin_categoria_produtos_path
	end

	private
		def categoria_params
			params.require(:categoria_produto).permit!
		end
end