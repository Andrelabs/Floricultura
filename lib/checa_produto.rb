#teste de criar um processo

require "rubygems"
require "active_record"

puts "======== Início do Teste ========"
ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",  
  :database => "lojavirtualdb",
  :pool => 5,
  :host => "localhost",
  :username => "jefferson",
  :password => "je@14051994"

})
ActiveRecord::Base.default_timezone = :local
ActiveRecord::Base.time_zone_aware_attributes = false

class Produto < ActiveRecord::Base	
	min = 5
	loop do
		Produto.all.each do |lsp|
			puts "------------------------------------------------------------------------------------------------"
			if lsp.quantidade < 1
				ActiveRecord::Base.connection().insert_sql("INSERT INTO monitors (status_id , produto_id ) VALUES (3 , #{lsp.id})")		
				#Monitor.find_by_sql("INSERT INTO monitor (status_id , produto_id ) VALUES (3 , #{lsp.id})")
				puts "Critico O produto id #{lsp.id} #{lsp.nome} está zerado"
			elsif lsp.quantidade < min
				ActiveRecord::Base.connection().insert_sql("INSERT INTO monitors (status_id , produto_id ) VALUES (2 , #{lsp.id})")
				#Monitor.find_by_sql("INSERT INTO monitor (status_id , produto_id ) VALUES (2 , #{lsp.id})")				
				puts "Alerta O produto id #{lsp.id} #{lsp.nome} está com estoque baixo quantidade #{lsp.quantidade}"
			else
				ActiveRecord::Base.connection().insert_sql("INSERT INTO monitors (status_id , produto_id ) VALUES (1 , #{lsp.id})")
				#Monitor.find_by_sql("INSERT INTO monitor (status_id , produto_id ) VALUES (1 , #{lsp.id})")
				puts "Produto #{lsp.nome} OK"
			end		
		end	
		puts "------------------------------------------------------------------------------------------------"	


		sleep 120
	end

end


