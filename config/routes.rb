Rails.application.routes.draw do

  #get '/restaurants/:id/vote', to: 'restaurants#vote' as: 'vote_restaurant'


  resources :restaurants

  root 'restaurants#index', as: 'restaurants_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
