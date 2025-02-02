Rails.application.routes.draw do
  get '/favorites/:id/addFavorite', to: 'favorites#addFavorite', as: 'addFavorite'
  resources :favorites
  get '/comments/:id/createComment', to: 'comments#createComment', as: 'createComment'
  get '/comments/postComment', to: 'comments#postComment', as: 'postComment'
  resources :comments

  get '/votes/voteHistory', to: 'votes#history', as: 'voteHistory'
  get '/votes/:Restaurant/stats', to: 'votes#stats', as: 'stats'
  get '/votes/:id/submitVoteUp', to: 'votes#submitVoteUp', as: 'submitVoteUp'
  get '/votes/:id/submitVoteDown', to: 'votes#submitVoteDown', as: 'submitVoteDown'
  resources :votes

  devise_for :users

  resources :sessions
  get '/restaurants/userHistory', to: 'restaurants#userHistory',  as: 'userHistory'
  get '/restaurants/:id/vote', to: 'restaurants#vote',  as: 'vote_cast'
  resources :restaurants, only: [:index, :new, :create, :show, :update, :vote]

  root 'restaurants#index', as: 'restaurants_index'

  devise_scope :user do
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
