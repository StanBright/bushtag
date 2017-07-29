Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :animals
  get '/discover', to: 'discover#index'
  get '/animals/:id', to: 'animals#show', constraints: {id: /.+/}
  root 'site#index'
end
