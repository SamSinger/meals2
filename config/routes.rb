Rails.application.routes.draw do
  get '/home', to: 'slots#new'
  get 'slots/index'

  get 'slots/new'

  get 'users/index'

  
  post '/register', to: 'users#create'

  get 'welcome/index'
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  resources :users
  resources :slots
  resources :sessions, only: [:create]
  root 'welcome#index'
end
