Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
   }
  root 'top#index'
  get 'top/notice'
  #resources :users, only: %i(show)
  resources :users do
    member do
      get :show, :following, :followers
    end
  end
  resources :microposts,          only: [:show,:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
