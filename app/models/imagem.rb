class Imagem < ActiveRecord::Base
	sel.table_name = "imagens"

	belongs_to :produto

  has_attached_file :imagem,
  									:styles => { :medium => "300x300>", :thumb => "100x100>" },
  									:default_url => "/images/:style/missing.png",
  									:url => "/assets/produtos/:style/:id_:basename.:extension",
  									:path => ":rails_root/public/assets/products/:style/:id_:basename.:extension"
 	validates_attachment_content_type :imagem, :content_type => ['image/jpeg', 'image/png']
end