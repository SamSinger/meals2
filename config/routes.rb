Rails.application.routes.draw do
  get '/home', to: 'services#new'
  get 'services/index', to: 'services#index'

  get 'services/new'

  get 'users/index'

  
  post '/register', to: 'users#create'

  get 'welcome/index'
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  resources :users
  resources :services
  resources :service_assignments, only: [:create]
  resources :sessions, only: [:create]
  root 'welcome#index'
 
end
