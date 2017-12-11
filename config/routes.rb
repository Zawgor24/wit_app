Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'omniauth#create'

  resources :users do
    resources :messages
  end

  root 'welcome#index'
end
