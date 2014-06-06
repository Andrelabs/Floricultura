class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :pedido_atual
  helper_method :current_user

  @teste = 10

  protected
    #verifica o pedido atual se a variável pedido_atual ou
    #a sessão em branco adiciona um novo pedido a ela
  	def pedido_atual
  		if @pedido_atual.nil? and !session[:pedido_id].blank?
  			@pedido_atual = Pedido.find_by_id(session[:pedido_id])
  		end
  		  @pedido_atual ||= Pedido.new
      
  	end

    #adiciona globalmente informações do usuário que está logado
    def current_user
      @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
    end
end
