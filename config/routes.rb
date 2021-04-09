Rails.application.routes.draw do

  get '/', to: 'channels#index'
  resources :channels
  resources :items
  
end
