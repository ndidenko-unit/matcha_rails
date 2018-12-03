Rails.application.routes.draw do

  get 'home/index'
  get '/friendships/:id', to: 'patients#show', as: 'patient'
  devise_for :users

  root 'home#index'

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :profiles
  resources :friendships do
    collection do
      post :block
      post :unblock
    end
  end
end

