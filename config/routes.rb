Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites,only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  root :to => 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get 'users/followings/:id' => 'users#followings', as: 'users_followings'
  get 'users/followers/:id' => 'users#followers', as: 'users_followers'
end