Rails.application.routes.draw do

  root to: "tweets#index"
  
  devise_for :users
  
  resources :tweets do
    resources :replies, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    member do
      get :followings, :followers
    end
  end

  namespace :admin do
    resources :tweets
    resources :users
    root "tweets#index"
  end

end
