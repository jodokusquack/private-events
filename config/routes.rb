Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root 'users#new'
end
