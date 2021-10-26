Rails.application.routes.draw do
  get 'home/search'
  require 'sidekiq/web'
  root "articles#index"

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
  get 'visitors/sendemail', to: 'visitors#index'
  get 'articles/byid/:id', to: 'articles#show'
  get 'visitors/search', to: 'visitors#search_articles'
  mount Sidekiq::Web => '/sidekiq'
  
end
