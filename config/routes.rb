Rails.application.routes.draw do

  get '/', to: 'channels#index'
  get '/types/:object_type', to: 'channels#index'
  resources :channels
  resources :items
  resources :votes
  resources :users
  
end
