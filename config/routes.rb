Rails.application.routes.draw do

  devise_for :users

  resources :wikis

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  
  root 'welcome#index'

end
