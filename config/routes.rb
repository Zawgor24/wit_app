Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'omniauth#create'
  
  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  resources :users do
    resources :messages
  end

  root 'welcome#index'
end
