Rails.application.routes.draw do

  devise_for :users

  resources :questions do
    resources :answers do
      resources :votes, only: [:create, :destroy]
    end
    resources :favorites, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]



  root 'tops#index'
end
