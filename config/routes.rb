Rails.application.routes.draw do

  resources :questions do
    resources :answers do
      resources :votes, only: [:create, :destroy]
    end
    resources :favorites, only: [:create, :destroy]
  end

  devise_for :users

  root 'tops#index'
end
