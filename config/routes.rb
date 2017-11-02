Rails.application.routes.draw do

  get 'collaborators/new'

  devise_for :users

  resources :wikis

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  resources :charges, only: [:new, :create] do
    collection do
      delete :downgrade
    end
  end

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'

end
