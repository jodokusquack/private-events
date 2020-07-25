Rails.application.routes.draw do
  root 'events#index'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/signup', to: 'users#new'

  resources :users, only: [:index, :show, :new, :create]
  get 'users/:id/past_events', to: 'users#past_events', as: 'past_events'

  resources :events, only: [:index, :show, :new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
