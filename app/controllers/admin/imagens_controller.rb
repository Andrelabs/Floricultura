class Admin::ImagensController < Admin::BaseController

	def new
		@imagem = Imagem.new
		@produto = Produto.find(params[:produto_id])
	end

	def create
		imagem = Imagem.new(imagem_params)
		if imagem.save
			flash[:success] = "Imagem Adicionada com sucesso"
			redirect_to(:controller => :produtos , :action => :edit , :id => imagem.produto_id)
		else
			render(:action => :new)
		end
	end

	def destroy
		produto_id = ""
		imagem = Imagem.find(params[:imagem_id])
		produto_id = imagem.produto_id
		system("rm -rf public/assets/produtos/ico/#{imagem.imagem_file_name};
						rm -rf public/assets/produtos/medium/#{imagem.imagem_file_name};
						rm -rf public/assets/produtos/small/#{imagem.imagem_file_name};
						rm -rf public/assets/produtos/original/#{imagem.imagem_file_name}")
		imagem.destroy
		flash[:notice] = "Imagem Removida"
		redirect_to :controller => :produtos , :action => :edit , :id => produto_id		
	end

	private
		def imagem_params
			params.require(:imagem).permit(:produto_id , :capa , :imagem)
		end
end