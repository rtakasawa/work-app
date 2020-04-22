Rails.application.routes.draw do
  root to: "sessions#new"
  resources :blogs
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :index, :create, :show]
  resources :favorites, only: [:create, :destroy]
end
