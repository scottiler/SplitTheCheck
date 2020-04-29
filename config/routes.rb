Rails.application.routes.draw do

  resources :comments
  get '/votes/voteHistory', to: 'votes#history', as: 'voteHistory'
  get '/votes/:Restaurant/stats', to: 'votes#stats', as: 'stats'
  resources :votes
  devise_for :users
  resources :sessions
  get '/restaurants/:id/vote', to: 'restaurants#vote',  as: 'vote_cast'
  get '/votes/:id/submitVoteUp', to: 'votes#submitVoteUp', as: 'submitVoteUp'
  get '/votes/:id/submitVoteDown', to: 'votes#submitVoteDown', as: 'submitVoteDown'

  resources :restaurants, only: [:index, :new, :create, :show, :update, :vote]

  root 'restaurants#index', as: 'restaurants_index'

  devise_scope :user do
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
