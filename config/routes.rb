Rails.application.routes.draw do
  require 'sidekiq/web'
  root "visitors#index"

  resources :articles do
    resources :comments
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/hello/:name', to:'hello#say'
  post 'visitors/contact', to: 'visitors#contact'
  
  mount Sidekiq::Web => '/sidekiq'
  
end
