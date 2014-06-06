class Usuario < ActiveRecord::Base
	#self.table_name = "usuarios"
	
	#attr_accessor :senha , :senha_confirmation

	before_save :encrypta_senha

  validates_confirmation_of :senha	
	validates_presence_of :senha , :on => :create
	validates_presence_of :email , :nome , :sobrenome 

	
	protected
		#metodo que criptografa senha
		def encrypta_senha
			if senha.present?
				self.senha_salt = BCrypt::Engine.generate_salt
				self.senha = BCrypt::Engine.hash_secret(senha , senha_salt)
			end
		end
		
		#metodo que autentica o usuário
		def self.atenticar(email , senha)			
			usuario = Usuario.find_by_email(email)			
			if usuario and usuario.senha == BCrypt::Engine.hash_secret(senha , usuario.senha_salt)
				usuario				
			else
				nil				
			end			
		end
	
end