Rails.application.routes.draw do
  root to: 'home#index'
  resources :users
  resources :attractions
  resources :rides
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end
