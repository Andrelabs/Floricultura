class Imagem < ActiveRecord::Base
	self.table_name = "imagens"

	belongs_to :produto

  has_attached_file :imagem,
  									:styles => { :small => "600x600#", :medium => "100x100>", :ico => "48x48>" },
  									:default_url => "/images/:style/missing.png",
  									:url => "/assets/produtos/:style/:id_:basename.:extension",
  									:path => ":rails_root/public/assets/produtos/:style/:id_:basename.:extension"
 	validates_attachment_content_type :imagem, :content_type => ['image/jpeg', 'image/png']
end