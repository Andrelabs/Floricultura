Lojavirtual::Application.routes.draw do
 
  get "entrar" => "sessoes#new" , :as => "entrar"
  get "sair" => "sessoes#destroy" , :as => "sair"

  root :to => "produtos#index"  

  resources :itens do
    collection do
      post 'atualizar_carrinho'
    end
  end

  resources :usuarios
  resources :produtos
  resources :itens
  resources :sessoes  

  namespace :admin do 
    get "/" => "menu#index"
    get "produtos/situacao_produto"    
    resources :produtos    
  end
 
end
