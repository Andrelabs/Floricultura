class Admin::ImagensController < BaseController

	def new
		@imagem = Imagem.new
	end

	def create
		imagem = Imagem.new(imagem_params)
		if imagem.save
			flash[:success] = "Imagem Adicionada com sucesso"
			redirect_to(:controller => :produto , :action => :edit , :id => imagem.produto_id)
		else
			render(:action => :new)
		end
	end

	private
		def imagem_params
			params.require(:imagem).permit(:produto_id, :imagem)
		end
end