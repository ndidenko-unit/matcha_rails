Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  get 'profiles/show'
  get 'home/index'
  devise_for :users

  root 'home#index'

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :profiles
  resources :friendships
end

