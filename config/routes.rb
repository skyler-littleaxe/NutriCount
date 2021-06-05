Rails.application.routes.draw do

  root to: 'home#welcome'
  get 'home/welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/users/:id/credentials/edit', to: 'users#edit_credentials', as: 'edit_credentials'
  put '/users/:id/credentials', to: 'user#update_credentials'
  patch '/users/:id/credentials', to: 'user#update_credentials'
  resources :users
  resources :meals
  resources :logs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
