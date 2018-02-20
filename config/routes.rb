Rails.application.routes.draw do

  root to: "tweets#index"
  
  devise_for :users
  
  resources :tweets

  resources :users, only: [:index, :show, :edit, :update]
end
