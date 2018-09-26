Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get 'top/notice'
  resources :users, only: %i(show)
end
