Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show] do
    collection do
      get 'favorite'
    end
  end

  resources :questions do
    resources :votes, only: [:create, :destroy]
    resources :answers do
      resources :votes, only: [:create, :destroy]
    end
    resources :favorites, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]

  root 'tops#index'
  resources :favorites, only: [:index]
end
