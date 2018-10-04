Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
   }
  root 'top#index'
  get 'top/notice'
  resources :users, only: %i(show)
end
