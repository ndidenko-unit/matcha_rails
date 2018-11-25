Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    get 'users/new' => 'devise/registrations#new', :as => 'new_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
    post 'users' => 'devise/registrations#create', :as => 'create_user_registration'
  end

  root 'home#index'

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
end
