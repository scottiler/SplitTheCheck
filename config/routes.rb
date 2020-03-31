Rails.application.routes.draw do

  resources :sessions
  get '/restaurants/:id/vote', to: 'restaurants#vote' 


  resources :restaurants

  root 'restaurants#index', as: 'restaurants_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
