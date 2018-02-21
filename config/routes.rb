Rails.application.routes.draw do

  root to: "tweets#index"
  
  devise_for :users
  
  resources :tweets

  resources :users, only: [:index, :show, :edit, :update] do
    resources :replies, only: [:create, :destroy]
  end

  namespace :admin do
    resources :tweets
    resources :users
    root "tweets#index"
  end


end
