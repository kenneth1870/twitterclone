Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'static_pages#index'
  end

  resources :tweets, except: %i[new edit] do
    member do
      post :reply
    end
  end
  resources :users, except: %i[new create] do
    member do
      get 'followers'
      get 'following'
      get 'favorites'
      get 'retweets'
    end
  end

  resources :relationships, only: %i[create destroy]
  resources :favorites, only: %i[create destroy]
  resources :retweets, only: %i[create destroy]
  resources :find_friends, only: :index
end
