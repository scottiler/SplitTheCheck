Rails.application.routes.draw do

  devise_for :users
  resources :sessions
  get '/restaurants/:id/vote', to: 'restaurants#vote',  as: 'vote'
  get '/restaurants/:id/voteUp', to: 'restaurants#voteUp', as: 'voteUp'


  resources :restaurants, only: [:index, :new, :show, :update, :vote]

  root 'restaurants#index', as: 'restaurants_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
