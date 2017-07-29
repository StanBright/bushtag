Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'site#index'

  match 'login', to: 'users#login', as: :login, via: [:get, :post]
  match 'logout', to: 'users#logout', as: :logout, via: [:get, :delete, :post]
  resources :users
end
