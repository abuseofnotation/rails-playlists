Rails.application.routes.draw do

  get '/', to: 'channels#index'
  get '/types/:object_type', to: 'channels#index'
  resources :channels
  resources :items 
  resources :votes
  get '/users', to: 'users#show'
  resources :users, only: [:show, :create]
  
end
