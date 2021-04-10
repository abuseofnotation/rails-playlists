Rails.application.routes.draw do

  get '/', to: 'channels#index'
  get '/channels/:object_type', to: 'channels#index'
  resources :channels
  resources :items
  resources :votes
  
end
