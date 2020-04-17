Rails.application.routes.draw do

  get '/votes/:@userVotes/voteHistory', to: 'votes#history', as: 'voteHistory'
  resources :votes
  devise_for :users
  resources :sessions
  get '/restaurants/:id/vote', to: 'restaurants#vote',  as: 'vote_cast'
  get '/votes/:id/submitVote', to: 'votes#submitVote', as: 'submitVote'


  resources :restaurants, only: [:index, :new, :show, :update, :vote]

  root 'restaurants#index', as: 'restaurants_index'

  devise_scope :user do
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
