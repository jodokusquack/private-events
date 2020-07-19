Rails.application.routes.draw do
  root 'events#index'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/signup', to: 'users#new'

  resources :users, only: [:index, :show, :new, :create]

  resources :events, only: [:index, :show, :new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
